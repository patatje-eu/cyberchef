FROM alpine:latest

LABEL org.labe-schema.name="cyberchef"

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

EXPOSE 8080

CMD nginx && npm start
