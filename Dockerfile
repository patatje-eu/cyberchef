FROM alpine:latest

LABEL maintainer="patatje-eu" \
      org.label-schema.name="cyberchef-patatje-docker" \
      org.opencontainers.image.source="https://github.com/patatje-eu/cyberchef"

RUN apk add --no-cache \
    git \
    nodejs \ 
    npm \
    nginx

RUN npm update -g npm
RUN npm install -g grunt-cli

RUN git clone https://github.com/gchq/CyberChef.git
COPY nginx.conf /etc/nginx/http.d/cyberchef.conf
RUN rm /etc/nginx/http.d/default.conf

WORKDIR /CyberChef
RUN npm install

EXPOSE 8000/tcp

CMD nginx && npm start
