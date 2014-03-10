evented = require 'evented.io'

Evented = evented 
  port: 5000
  dir: __dirname

User = new Evented.Collection('User');
Todo = new Evented.Collection('Todo');

Evented.publish User, ->
  return User.find({_id: this.userId()})

Evented.publish Todo, ->
  return Todo.find({user_id: this.userId()})
