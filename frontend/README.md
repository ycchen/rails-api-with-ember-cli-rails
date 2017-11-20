# fronted

This README outlines the details of collaborating on this Ember application.
A short introduction of this app could easily go here.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](https://git-scm.com/)
* [Node.js](https://nodejs.org/) (with NPM)
* [Ember CLI](https://ember-cli.com/)
* [Google Chrome](https://google.com/chrome/)

## Installation

* `git clone <repository-url>` this repository
* `cd fronted`
* `npm install`

## Running / Development

* `ember serve`
* Visit your app at [http://localhost:4200](http://localhost:4200).
* Visit your tests at [http://localhost:4200/tests](http://localhost:4200/tests).

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* `ember test`
* `ember test --server`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

### Deploying

Specify what it takes to deploy your app.

## Further Reading / Useful Links

* [ember.js](https://emberjs.com/)
* [ember-cli](https://ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)

* Generate application route

```html
ember g route application
```
```js
# frontend/app/routes/application.js

import Route from '@ember/routing/route';

export default Route.extend({
  model(){
    return this.store.findAll('user');
  }
});
```
* Generate User model

```html
# terminal
ember g model user

installing model
  create app/models/user.js
installing model-test
  create tests/unit/models/user-test.js
```

```js
# modify app/models/user.js
import DS from 'ember-data';

export default DS.Model.extend({
  first_name: DS.attr('string'),
  last_name:  DS.attr('string'),
  email:      DS.attr('string')
});
```

```html
# modify app/template/application.hbs

```

* Make sure to the data from Rails side needs to be JSON API format in order to shows up right on Ember side

```html
# make sure the active model serializers set to use jason_api
```

* Generate adapters

```html
ember g adapter application

➜  frontend git:(master) ✗ ember g adapter application
installing adapter
  create app/adapters/application.js
installing adapter-test
  create tests/unit/adapters/application-test.js
```
