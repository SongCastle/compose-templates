# express-postgres

Docker Compose for Express with Yarn Workspaces

## Getting Started

```sh
$ cp .env.sample .env

$ docker compose build
$ docker compose run --rm express yarn install
$ docker compose run --rm express yarn workspaces run build
$ docker compose up
```

## Directory Structure

```
src
  |- services
    |- users // users package
      |- index.ts
      |- package.json
      |- ...
    |- books // books package
      |- index.ts
      |- package.json
      |- ...
  |- index.ts // root package
  |- package.json
  |- ...
```

## APIs

- `http://localhost:3000`
- `http://localhost:3000/users`
- `http://localhost:3000/books`
- ...
