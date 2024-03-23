# Postgres

Docker Compose for Postgres

<br/>

# Getting Started

<br/>

```sh
% cp password.txt.sample password.txt
% docker compose up
% docker compose exec postgres ash

# postgres cli 起動
% psql -U root -d postgres
```

### ユーザ一覧

<br/>

```
postgres-# \du
                             List of roles
 Role name |                         Attributes
-----------+------------------------------------------------------------
 root      | Superuser, Create role, Create DB, Replication, Bypass RLS
```

### データベース一覧

<br/>

```
postgres-# \l
                                                    List of databases
   Name    | Owner | Encoding | Locale Provider |   Collate   |    Ctype    | ICU Locale | ICU Rules | Access privileges
-----------+-------+----------+-----------------+-------------+-------------+------------+-----------+-------------------
 dev       | root  | UTF8     | libc            | ja_JP.UTF-8 | ja_JP.UTF-8 |            |           |
 postgres  | root  | UTF8     | libc            | ja_JP.UTF-8 | ja_JP.UTF-8 |            |           |
 template0 | root  | UTF8     | libc            | ja_JP.UTF-8 | ja_JP.UTF-8 |            |           | =c/root          +
           |       |          |                 |             |             |            |           | root=CTc/root
 template1 | root  | UTF8     | libc            | ja_JP.UTF-8 | ja_JP.UTF-8 |            |           | =c/root          +
           |       |          |                 |             |             |            |           | root=CTc/root
(4 rows)
```

### データベース切替

<br/>

```
postgres-# \c dev
You are now connected to database "dev" as user "root".
```

### テーブル一覧

<br/>

```
dev=# \d
               List of relations
 Schema |       Name        |   Type   | Owner
--------+-------------------+----------+-------
 public | serial_ids        | table    | root
 public | serial_ids_id_seq | sequence | root
 public | uuid_ids          | table    | root
(3 rows)
```

```
dev=# \dt public.*; \dt mine.*;
          List of relations
 Schema |    Name    | Type  | Owner
--------+------------+-------+-------
 public | serial_ids | table | root
 public | uuid_ids   | table | root
(2 rows)

          List of relations
 Schema |    Name    | Type  | Owner
--------+------------+-------+-------
 mine   | serial_ids | table | root
 mine   | uuid_ids   | table | root
(2 rows)
```

### テーブル詳細

<br/>

```
dev=# \d serial_ids
                                        Table "public.serial_ids"
   Column   |            Type             | Collation | Nullable |                Default
------------+-----------------------------+-----------+----------+----------------------------------------
 id         | integer                     |           | not null | nextval('serial_ids_id_seq'::regclass)
 title      | character varying(24)       |           | not null |
 created_at | timestamp without time zone |           | not null |
Indexes:
    "serial_ids_pkey" PRIMARY KEY, btree (id)
```

```
dev=# \d mine.serial_ids
                                            Table "mine.serial_ids"
   Column   |            Type             | Collation | Nullable |                   Default
------------+-----------------------------+-----------+----------+---------------------------------------------
 id         | integer                     |           | not null | nextval('mine.serial_ids_id_seq'::regclass)
 title      | character varying(24)       |           | not null |
 created_at | timestamp without time zone |           | not null |
Indexes:
    "serial_ids_pkey" PRIMARY KEY, btree (id)
```

### スキーマ一覧

<br/>

```
dev-# \dn
      List of schemas
  Name  |       Owner
--------+-------------------
 mine   | root
 public | pg_database_owner
(2 rows)
```
