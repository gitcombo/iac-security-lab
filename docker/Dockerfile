FROM alpine:3.22
RUN addgroup -S lab && adduser -S -G lab lab
USER lab
HEALTHCHECK CMD ["true"]
CMD ["printf", "IaC lab\n"]
