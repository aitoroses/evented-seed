(function() {
  var Evented, Todo, User, evented;

  evented = require('evented.io');

  Evented = evented({
    port: 5000,
    dir: __dirname
  });

  User = new Evented.Collection('User');

  Todo = new Evented.Collection('Todo');

  Evented.publish(User, function() {
    return User.find({
      _id: this.userId()
    });
  });

  Evented.publish(Todo, function() {
    return Todo.find({
      user_id: this.userId()
    });
  });

}).call(this);
