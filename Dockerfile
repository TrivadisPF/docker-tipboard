FROM ubuntu:16.04

RUN apt-get update -q && \
    apt-get install -qqy python-dev python-pip supervisor && \
    apt-get clean && \
    pip install tipboard && \
    mkdir -p /root/logs /root/.tipboard/custom_tiles /dashboards

ADD /supervisord.conf /etc/supervisor/supervisord.conf
COPY /data/config/* /root/.tipboard/
COPY /data/sample/* /dashboards

EXPOSE 7272

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["/usr/bin/supervisord", "-j", "/root/supervisord.pid"]
