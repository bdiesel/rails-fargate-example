# Produciton.com

Produciton is a to-do list for launching your application into production.

Choose from among various pre-filled production checklists, fork them, and tweak
them to match your desired workflow. Then use them going forward to make sure
you don't forget anything.

For instance, when deploying a Rails app:

- SSL
- Backups
- Test backup restore
- Continuous Integration
- Continuous Deployment
- Error monitoring service
- Application monitoring service
- Uptime monitoring
- CDN
- Security audit solution (Brakeman, Gemnasium, etc)
- ...

## Development

To get started with development:

### Clone the repo

```sh
git@github.com:bdiesel/rails-fargate-example.git
```

### Install dependencies

```sh
bundle
```

### Setup the database

```sh
rake db:setup
```

### Run the tests

```sh
rake
```

### Run the app

```docker build .
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
docker-compose up
```

Then visit <http://localhost:3000>

## License

Produciton.com is [MIT Licensed](./LICENSE).
