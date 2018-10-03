# Prisoner Categorisation Tool (prototype)

To set up:

```
rails db:create db:migrate db:seed
```

This will create the database (SQLite), run migrations and seed the sample cases and user accounts (found in `db/seeds.rb`).

Sample user accounts:

* manager@example.com
* supervisor@example.com
* security@example.com
* regional@example.com

All accounts share the password "testing123"

The database can be reset with `rails db:reseed`

Development and test environments are setup to use SQLite. Production is Postgres.
