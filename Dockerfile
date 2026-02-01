FROM alpine:latest

RUN apk add --no-cache nginx openssl

# Create necessary folders
RUN mkdir -p /run/nginx /etc/ssl/private

# Copy the keys we generated
COPY nginx-selfsigned.crt /etc/ssl/certs/
COPY nginx-selfsigned.key /etc/ssl/private/

# Copy the custom config and your website
COPY default.conf /etc/nginx/http.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
