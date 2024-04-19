# express-postgres

Docker Compose for Express & Postgres

## Getting Started

```sh
$ cp password.txt.sample password.txt
$ cp .env.sample .env

$ docker compose build
$ docker compose run --rm express yarn install
$ docker compose run --rm express yarn prisma generate
$ docker compose run --rm express yarn run dev:seed
$ docker compose up
```

Then access to `localhost:3000`.

## Routes

Path | Description
:-|:-
`GET /` | Top Page
`GET /users` | List users

## Commands

```
# Check types in source code
$ docker compose run --rm express yarn run dev:typecheck

# Lint source code
$ docker compose run --rm express yarn run dev:lint

# Lint source code and fix it
$ docker compose run --rm express yarn run dev:lint-fix

# Populate seed data to DB
$ docker compose run --rm express yarn run dev:seed
```
