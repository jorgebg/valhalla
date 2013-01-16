class Manager extends Base.Manager
  #subscriptions
  @subscribe 'messages'
  @subscribe 'users'

class Template extends Base.Template
  @allUsers.helpers
  # get all users
    users: -> Meteor.users.find({})

  # add message events
  @chatBox.events =
    'keydown #add-message-form input': (e, t) ->
      if e.which == 13
        ChatBox.send t

    'click #add-message-form button': (e, t) ->
      e.preventDefault()
      ChatBox.send t

  @chatBox.helpers
    # get all messages
    messages: -> Messages.find( {}, { sort: { time: -1 }} )

class ChatBox
  # add new message
  @send: (template)->
    input = template.find '#message-input'
    if input.value != ''
      Messages.insert
        author: Manager.user()
        body: input.value
        time: Date.now()
    input.value = ''