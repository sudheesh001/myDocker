FROM ubuntu
MAINTAINER Sudheesh Singanamalla "sudheesh95@gmail.com"
RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-available/default-ssl

ADD etc/tor/torrc /etc/tor/torrc
ADD etc/privoxy/config /etc/privoxy/config
ADD etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 8118
EXPOSE 80

CMD ["nginx"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

