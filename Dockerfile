FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install --yes --no-install-recommends software-properties-common
RUN apt-get install --yes --no-install-recommends curl
RUN apt-get install --yes --no-install-recommends python-pip
RUN apt-get install --yes --no-install-recommends libmysqlclient-dev
RUN pip install Django
ADD mysite /mysite
RUN apt-get install --yes --no-install-recommends supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
ENTRYPOINT ["/bin/bash", "-c", "/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf -n"]

