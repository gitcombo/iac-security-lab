# checkov:skip=CKV_DOCKER_2: EX-IAC-001 aprobado por gitcombo; vence 2026-12-24. Tarea puntual; el resultado se verifica con el código de salida.
FROM alpine:3.22
RUN addgroup -S lab && adduser -S -G lab lab
USER lab
CMD ["printf", "IaC lab\n"]
