FROM msaraiva/elixir-dev:1.0.5

EXPOSE 8080

COPY echo /opt/app

WORKDIR /opt/app

RUN [ "mix", "deps.get" ]

CMD [ "mix", "run", "--no-halt" ]
