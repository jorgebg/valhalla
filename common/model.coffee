#Messages = new Meteor.Collection('messages')

class Messages extends Base.Collection
   @initialize 'messages'
   @publish =>
   	 @collection.find {}
   @allow insert: (userId, doc) -> doc.author._id == userId
   @deny {}
