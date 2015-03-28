module.exports = class Service
  constructor: (@_channel) ->
    unless @_channel then throw new Error "Missing Channel"
    @_resources = {}
    @_actions = []
    @_channel.on 'data', (message) => @_process message

  _hasError: (err, data) ->
    switch
      when err
        @_channel.write error:err
      when not data
        @_channel.write error:"No data"
      else
        return false
    return true

  _process: (message) ->
    {id, params} = message
    resource = message.resource?.toLowerCase()
    action = message.action?.toLowerCase()

    switch
      when not @_resources[resource]
        @_channel.write error: "Invalid resource: #{resource}"

      when not (action in @_actions)
        @_channel.write error: "Invalid action: #{action}"

      when typeof this[action] isnt 'function'
        @_channel.write error: "Missing action: #{action}"

      else
        action = this[action]
        action.call this, resource, id, params

    return this
