FROM nginx:alpine

COPY dhparams.pem /etc/nginx/ssl/dhparams.pem
COPY nginx.conf /etc/nginx/nginx.conf
COPY servers/* /etc/nginx/conf.d/
COPY .htpasswd /etc/nginx/.htpasswd