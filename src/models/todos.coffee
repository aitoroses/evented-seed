mongoose = process.modules.mongoose
Schema = mongoose.Schema

todoSchema = Schema
  
  title:
    type: String
    required: true
    unique: true

  done:
    type: Boolean
    required: true

  user_id:
    type: Schema.Types.ObjectId
    required: true

# Todo model export
 module.exports = mongoose.model('Todo', todoSchema);
