FROM owasp/modsecurity-crs:nginx-alpine

USER root

RUN echo "build v3"

# Reemplaza el script problemático por uno vacío, esté en la ruta que esté
RUN find / -name "0-move-writables.sh" -not -path "/proc/*" 2>/dev/null \
    -exec sh -c 'printf "#!/bin/sh\nexit 0\n" > "$1" && chmod +x "$1"' _ {} \;

ENV PORT=8080
ENV BACKEND=https://mihorario-gateway-production.up.railway.app
ENV PROXY_SSL=off
ENV PROXY_PRESERVE_HOST=off
ENV MODSEC_RULE_ENGINE=DetectionOnly
ENV PARANOIA=1
