###
# Controller Structure (API definition)

API = 
    method: 'get'
    path: "/users"
    version: 1
    description: 'Get a list of all users.'
    docURL: "/PATH/TO/DOCS"
    allowedUserKinds: ["USER", "KINDS"]
    roles: ["ROLE1", "ROLE2", {'partner':["ROLE4", ...]}]
    params: {
        'required': ["REQUIRED", "PARAMETERS", {"customer":["REQ1", ...]}, ["ONE", "OR", "ANOTHER"]]
        'optional': ["OPTIONAL", "PARAMETERS"]
    
    callback: (req, res, next) ->
        // THE API IMPLEMENTATION
    
    stubData: "KEY:DOT.DELIMITED.KEY" || {DATA} || FUNCTION(api, res),

## You can create this structure type constructor
###

module.exports = (app) ->

  return [] # This are the actions [API]