FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python3 python3-pip curl unzip libgconf-2-4 cron vim

RUN pip3 install pytest selenium requests

ENV CHROMEDRIVER_VERSION 2.36
ENV CHROMEDRIVER_SHA256 2461384f541346bb882c997886f8976edc5a2e7559247c8642f599acd74c21d4
ENV EDITOR vim

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

VOLUME /data

WORKDIR /data

CMD /bin/bash
