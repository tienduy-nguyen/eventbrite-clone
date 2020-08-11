# EventLove - Eventbrite clone
This is a website clone of eventbrite built with Ruby on Rails.

Live demo [https://eventlove.herokuapp.com](https://eventlove.herokuapp.com/)




## Application

Envent online

## Installation

- Pre-install bundle et gem dependencies.
  ```
  $ bundle install
  $ bundle update
  ```
- Configuration de data base.
  
  We use the postgres as the database. To run this project with your local postgres, you need have or create an user for the postgres database.

  >username: postgres
  >password: postgres

  If you don't want to configure this user on your computer. You just need to replace your username/password in the `config / database.yml` file

  ```yml
  development:
  <<: *default
  database: bairbnb_development
  host: localhost
  username: <<your-user-name>>
  password: <<your-password>>
  ```

- Run the database on your computer
  
  ```bash
  $ rails db:create #ou rails db:create:all #ou rake db:create:all
  $ rails db:migrate
  $ rails db:seed
  ```


## Contributeurs

- [:fire: Stanislas BASQUIN](https://github.com/StanislasBASQUIN)
- [:v: Tien Duy NGUYEN](https://github.com/tienduy-nguyen)

