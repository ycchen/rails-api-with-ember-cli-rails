import DS from 'ember-data';
import Publisher from './publisher';

export default DS.Model.extend({
  name: DS.attr('string'),
  books: DS.hasMany('book')
});
