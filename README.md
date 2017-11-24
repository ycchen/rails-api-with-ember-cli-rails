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

* Generate scaffold book model
```ruby
#terminal

rails g scaffold book title 'price:decimal{5,2}' author:references publisher:references{polymorphic}

rails g scaffold author name

rails g scaffold publishing_house name 'discount:decimal{2,2}'

rake db:migrate

# populate data for those models

#db/seeds.rb
```

* Generate models with Ember CLI

```ruby
ember generate resource books title:string price:number author:belongs-to publisher:belongs-to

# ➜  frontend git:(master) ✗ ember g resource books title:string price:number author:belongs-to publisher:belongs-to
# installing model
#   create app/models/book.js
# installing model-test
#   create tests/unit/models/book-test.js
# installing route
#   create app/routes/books.js
#   create app/templates/books.hbs
# updating router
#   add route books
# installing route-test
#   create tests/unit/routes/books-test.js

ember g resource authors name:string books:has-many

# ➜  frontend git:(master) ✗ ember g resource authors name:string books:has-many
# installing model
#   create app/models/author.js
# installing model-test
#   create tests/unit/models/author-test.js
# installing route
#   create app/routes/authors.js
#   create app/templates/authors.hbs
# updating router
#   add route authors
# installing route-test
#   create tests/unit/routes/authors-test.js

ember g resource publishing-houses name:string discount:number books:has-many

# ➜  frontend git:(master) ✗ ember g resource publishing-houses name:string discount:number books:has-many
# installing model
#   create app/models/publishing-house.js
# installing model-test
#   create tests/unit/models/publishing-house-test.js
# installing route
#   create app/routes/publishing-houses.js
#   create app/templates/publishing-houses.hbs
# updating router
#   add route publishing-houses
# installing route-test
#   create tests/unit/routes/publishing-houses-test.js
```

* Generate Publisher model as polymorphic relationship in Emeber

```ruby
ember g model publisher

# ➜  frontend git:(master) ✗ ember g model publisher
# installing model
#   create app/models/publisher.js
# installing model-test
#   create tests/unit/models/publisher-test.js
```

* Generate ember component

```Ruby
ember g component book-cover

➜  frontend git:(master) ✗ ember g component book-cover
installing component
? Overwrite app/templates/components/book-cover.hbs? Yes, overwrite
  create app/components/book-cover.js
  overwrite app/templates/components/book-cover.hbs
installing component-test
  create tests/integration/components/book-cover-test.js
```

* Install ember-modal-dialog
```ruby
ember install ember-modal-dialog
ember install ember-cli-sass

# app.scss
@import "ember-modal-dialog/ember-modal-structure";
@import "ember-modal-dialog/ember-modal-appearance";


ember install ember-route-action-helper
```

* Generate ember controller for books

```ruby
ember g controller books

# ➜  frontend git:(master) ✗ ember g controller books
# installing controller
#   create app/controllers/books.js
# installing controller-test
#   create tests/unit/controllers/books-test.js
```
