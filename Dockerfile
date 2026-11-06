FROM owasp/modsecurity-crs:nginx

USER root
RUN ls -la /docker-entrypoint.d/ && \
    rm -f /docker-entrypoint.d/*move-writables* && \
    ls -la /docker-entrypoint.d/

ENV PORT=8080
ENV BACKEND=https://mihorario-gateway-production.up.railway.app
ENV PROXY_SSL=on
ENV PROXY_PRESERVE_HOST=off
ENV MODSEC_RULE_ENGINE=DetectionOnly
ENV PARANOIA=1
