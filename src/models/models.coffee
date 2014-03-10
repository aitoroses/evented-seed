###
# Model Structure

mongoose = process.modules.mongoose
validate = process.modules.validate
bcrypt = process.modules.bcrypt
SALT_WORK_FACTOR = 10

userSchema = mongoose.Schema
  
  username:
    type: String
    required: true
    unique: true
    validate: validate('len', 5, 10)

  password:
    type: String
    required: true
    validate: validate('len', 4, 12)

  kind:
    type: String
    required: true
    enum: ['administrator', 'normal']

# Bcrypt middleware
userSchema.pre 'save', (next) ->
  user = this

  if !user.isModified('password') then return next()

  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) ->
    if err then return next(err)

    bcrypt.hash user.password, salt, (err, hash) ->
      if(err) then return next(err)
      user.password = hash
      next()

# Password verification
userSchema.methods.comparePassword = (candidatePassword, callback) ->
  bcrypt.compare candidatePassword, this.password, (err, isMatch) ->
    if(err) then return callback(err)
    callback(null, isMatch)


# User model
 module.exports = mongoose.model('User', userSchema);
###
