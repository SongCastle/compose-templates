# Phoenix

Docker Compose for Phoenix

```sh
$ cp password.txt.sample password.txt
$ cp .env.sample .env

$ docker compose build
$ docker compose run --rm phoenix mix deps.get
$ docker compose run --rm phoenix mix ecto.create
$ docker compose up -d
```

Then access to `localhost:4000`.
