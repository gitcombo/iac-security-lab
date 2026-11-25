#!/bin/sh
set -eu

if [ "$#" -gt 1 ]; then
    printf 'Uso: %s [archivo.tsv]\n' "$0" >&2
    exit 2
fi

app_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
input=${1:-"$app_dir/tickets.tsv"}

if [ ! -f "$input" ] || [ ! -r "$input" ]; then
    printf 'No se puede leer el archivo: %s\n' "$input" >&2
    exit 2
fi

awk -F '\t' '
    {
        sub(/\r$/, "")
        if (NF != 3 || $1 !~ /^INC-[0-9]+$/ || $2 !~ /^(abierto|en_progreso|resuelto)$/ || $3 !~ /^(alta|media|baja)$/ || seen[$1]++) {
            printf "Registro inválido o duplicado en la línea %d\n", NR > "/dev/stderr"
            invalid = 1
            exit 2
        }
        count[$2]++
        if ($2 != "resuelto" && $3 == "alta") priority++
    }
    END {
        if (!invalid) {
            printf "Total de tickets: %d\n", NR
            printf "Abiertos: %d\nEn progreso: %d\nResueltos: %d\n", count["abierto"], count["en_progreso"], count["resuelto"]
            printf "Pendientes de prioridad alta: %d\n", priority
        }
    }
' < "$input"
