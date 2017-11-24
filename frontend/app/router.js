import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('books', { path: '/'});
  this.route('authors', { path: '/author/:author_id'});
  this.route('publishing-houses');
});

export default Router;
