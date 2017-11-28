# README

This is a practice app for playing with migrations in rails.

* Ruby version 2.4.2
* Rails version 5.0.6
* Postgres

## Tasks

1. Build a new Rails app
```
rails new practice_rails_migrations --skip-turbolinks --database=postgresql --skip-test
```

2. Create and migrate a Users table with :name and :email columns.
```
rails g model user name:string email:string
rake db:migrate
```

3. Make a new migration to add a :nickname column to the table and run it.
```
rails g migration AddNicknameToUsers nickname:string
rake db:migrate
```

4. Make a new migration to add a Posts table with :title and :body and run it.
```
rails g model post title:string body:text
rake db:migrate
```

5. Make a new migration to add a foreign key to your Posts table so a user can have many posts and run it.
```
rails g migration AddUserIDToPost user:references
rake db:migrate
```

6. Make a new migration to add an index to this foreign key.
```
rails g migration AddIndexToPost // turns out it was handled with `references`
rails d migration AddIndexToPost
```

7. Examine your migrations history with rake db:migrate:status
```
db:migrate:status
```

8. Roll back the latest migrations and re-check the history
```
rake db:rollback STEP=3
db:migrate:status
```

9. a: Roll back all migrations to the beginning and rerun them.
```
rake db:migrate:reset
```

9. b: Roll back all migrations to the beginning.
```
rake db:drop
```

10. Play with migrating and rolling back.

11. Now play with modifying migration files and trying to roll them back after they've been run. Play with running Ruby code in your migrations.
```
- Migrations are all up.
- Modified CreateUsers one to build users in the `change` method.
- Ran `rake db:migrate`
- Checked console and saw that users were not created
```

```
- Ran `rake db:reset`
- Checked console and saw that users were not created because `reset` builds from the schema
- Ran `rake db:migrate`
- Checked console and saw that users were not created
```

```
- Ran rake db:drop
- Ran rake db:create
- Ran rake db:migrate:status // migrations don't exist yet
- Ran rake db:migrate
- Checked console and saw that users were created
```

```
- Modified CreatePosts one to build posts in the `change` method.
- Ran rake db:migrate:down VERSION=20171128214820 to take down that specific migration
- Failed because other migrations depend on it
- Ran rake db:rollback STEP=2
- It rolled back the last 3 migrations
- Ran rake db:rollback STEP=0
- It rolled back nothing
- Ran rake db:rollback STEP=1
- It rolled back the last migration
- Ran rake db:rollback STEP=1 again
- It rolled back the preceeding migration
- Ran rake db:migrate
- It ran all unrun migrations and populated the Posts table
```

12. Keep playing until you're comfortable migrating in all directions and what the implications are of changing a migration.
```
- added loop to assign all posts to the first user in the AddUserIdToPost migration change method
- Ran rake db:rollback to rollback that migration
- It ran the create method and tried to generate that data, but there was no field for it to live in
- rake db:migrate
- user ids were mapped to the posts
```
