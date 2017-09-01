FROM ethereum/client-go

ENV USER=app

# Add user
RUN adduser -S -D -H -G root -h /home $USER

# Install Packages
RUN apk --no-cache upgrade \
 && apk --no-cache add \
      bash wget curl \
      git nodejs nodejs-npm

# Install dumb-init (avoid PID 1 issues). https://github.com/Yelp/dumb-init
RUN curl -Lo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 \
 && chmod +x /usr/local/bin/dumb-init 

# Grant privileges
RUN chgrp -R 0     /var /etc /home \
 && chmod -R g+rwX /var /etc /home \
 && chmod 664 /etc/passwd /etc/group

WORKDIR /home
VOLUME /home

# Install Wetty
# RUN git clone https://github.com/amolinado/wetty \
#  && cd wetty \
#  && npm install

# EXPOSE 3000 8000

USER $USER
ADD entrypoint.sh /
ENTRYPOINT  ["dumb-init","/entrypoint.sh"]
