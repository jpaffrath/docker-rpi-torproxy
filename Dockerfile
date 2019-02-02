FROM arm32v7/debian:stretch

LABEL maintainer "Julius Paffrath <juliuspaffrath@web.de>"

RUN apt-get update && \
    apt-get -y install tor polipo procps

COPY config /etc/polipo/config
COPY torrc /etc/tor/torrc

COPY run.sh /tmp/
RUN chmod +x /tmp/run.sh

EXPOSE 8123

CMD ["./tmp/run.sh"]
