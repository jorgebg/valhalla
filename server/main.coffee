class Manager extends Base.Manager
  #publications
  #@publish 'messages', -> Messages.find {}
  #@publish 'users', -> Meteor.users.find {}, fields: {'username':1}

#Messages.allow insert: (userId, doc) -> return doc.author._id == userId