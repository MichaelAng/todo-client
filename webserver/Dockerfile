FROM nginx:alpine

# Link nginx logs to stdout and stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /webserver

# Copy these files into the image
ADD startup.sh /webserver/startup.sh
ADD nginx.development.conf /etc/nginx/nginx.development.conf
ADD nginx.remote.conf /etc/nginx/nginx.remote.conf
ADD /dist /usr/src/app/dist

WORKDIR /webserver

CMD ["./startup.sh"]
