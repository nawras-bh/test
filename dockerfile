FROM dockerterratest 

RUN mkdir -p /home/app

COPY *.tf /home/app/
COPY docker-tests.sh /home/app/
COPY modules /home/app/modules
COPY test /home/app/test

WORKDIR /home/app/test
RUN go mod tidy ; exit 0
WORKDIR /home/app

RUN chmod +x ./docker-tests.sh
ENTRYPOINT ["./docker-tests.sh"]