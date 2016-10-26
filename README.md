# Deed

A privacy risk assessment tool inspired by NIST.

> "It takes many good deeds to build a good reputation, and only one bad one to lose it."
> – Benjamin Franklin

## Deployment

To deploy the app yourself, you may do the following:

1. Get set up with Cloud.gov
   ([instructions](https://docs.cloud.gov/getting-started/setup/))
1. Target your sandbox by running: `cf target -o sandbox`
1. Set up the database:
   `cf create-service aws-rds shared-psql identity-deed-db`
1. Set the `SECRET_TOKEN` env var for the app:
   `cf set-env <APP_NAME> SECRET_KEY_BASE `rake secret`
1. Deploy! `cf push APP_NAME -f .manifest.yml`
1. Note that `manifest.yml` currently assumes an app name of `identity-deeds`.
   Since app names must be unique, apps deployed to new sandbox accounts will
   need a different name and the manifest file will need to be edited.
1. See `db/seeds.rb` to log in as one of the seed users.
