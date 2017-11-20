# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Genrate rails-api only application

```html
rails new rails-api --api

```

* Add ember-cli-rails, active_model_serializers gems to Gemfile

```ruby
gem 'ember-cli-rails'
gem 'active_model_serializers'
```

* Generate ember application within rails-api/ folder

```ruby
  ember new fronted --skip-git
```

* Generate the gem's initializer:

```ruby
  rails g ember:init

  # This will create the following initializer:
  # config/initializers/ember.rb
  EmberCli.configure do |c|
    c.app :adminpanel # path defaults to `Rails.root.join("adminpanel")`
    c.app :frontend,
     path: "/path/to/your/ember-cli-app/on/disk"
    c.app :payments, silent: true # by default it's false
  end

  # You can customize frontend application path location: this will go up one folder level for ember-frontend folder
  c.app :frontend, path: "../ember-frontend"

```

* Install the ember-cli-rails-addon:

```ruby
  cd path/to/frontend
  ember install ember-cli-rails-addon
```

* Configure rails to route requests to the frontend Ember application
```ruby
# config/routes.rb

Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/"
end
```

* Install Ember application's dependencies

```ruby
# terminal

rake ember:install
```

* Generate User model in rails-api

```ruby
rails g model User first_name last_name email

# terminal

rake db:migrate

rails g controller Users index

```

* Generate seeds.rb to populate Users table

```ruby
# db/seeds.rb
User.delete_all

(1..100).each do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email
    )
end
```

* Generate serializers for User model

```ruby
rails g serializer user

# add all of columns of User model to the UserSerializer

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
end

# add initializers/ams.rb
ActiveModelSerializers.config.adapter = :json_api

```
