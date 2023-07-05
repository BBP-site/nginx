FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY certificate.crt /etc/nginx/certificate.crt
COPY key.key /etc/nginx/key.key

EXPOSE 443 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
