FROM owasp/modsecurity-crs:nginx-alpine

USER root

ENV PORT=8080
ENV BACKEND=https://mihorario-gateway-production.up.railway.app
ENV PROXY_SSL=on
ENV MODSEC_RULE_ENGINE=DetectionOnly
ENV PARANOIA=1