import Route from '@ember/routing/route';

export default Route.extend({
  model(){
    return this.store.findAll('user');
    // return[{
    //     first_name: 'Andy',
    //     last_name: 'hello1',
    //     email: 'test@test.com'
    //   },{
    //     first_name: 'John',
    //     last_name: 'hello1',
    //     email: 'test@test.com'
    //   },{
    //     first_name: 'Bob',
    //     last_name: 'hello1',
    //     email:  'test@test.com'
    //   },{
    //     first_name: 'Rich',
    //     last_name: 'hello1',
    //     email:  'test@test.com'
    //   }]
  }
});
