FROM python:3.5-alpine3.9

LABEL maintainer="Mark Stunnenberg (mark.stunnenberg@gmail.com)" \
      version="1.0"

RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories
RUN apk --no-cache add git su-exec

RUN pip install virtualenv

RUN adduser -S sentinel

USER sentinel

RUN cd /home/sentinel && git clone https://github.com/gobytecoin/sentinel.git

WORKDIR /home/sentinel/sentinel

RUN virtualenv ./venv \
 && ./venv/bin/pip install -r requirements.txt

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./venv/bin/python", "bin/sentinel.py"]
