#Messages = new Meteor.Collection('messages')

class Messages extends Base.Collection
   @initialize 'messages'
   @publish => @find {}
   @allow insert: (userId, doc) ->
   	        doc.author._id is userId
          update: (userId, docs, fields, modifier) ->
          	false
          remove: (userId, docs) ->
          	false
          fetch:
          	['author']
   @deny {}

class Users extends Base.Collection
  @collection: @manager.users
  @publish => @find {}, fields: 'username': true