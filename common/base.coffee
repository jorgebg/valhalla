Base = {}

class Base.Manager extends Meteor

if Meteor.isClient
  class Base.Template extends Template

class Base.Collection
  @manager = Base.Manager
  
  @publish = (nameOrFunc, func=null) ->
    if @manager.isServer
      if func is null
        func = nameOrFunc
        name = @id
      else
        name = nameOrFunc
      @manager.publish name, func

  @allow = (options) ->
    if @manager.isServer
      @collection.allow options

  @deny = (options) ->
    if @manager.isServer
      @collection.deny options

  @find = (selector, options={}) ->
    @collection.find selector, options

  @findOne = (selector, options={}) ->
    @collection.findOne selector, options

  @insert = (doc, callback=null) ->
    @collection.insert doc, callback

  @update = (selector, modifier, options={}, callback=null) ->
    @collection.update selector, modifier, options, callback

  @remove = (selector, callback=null) ->
    @collection.remove selector, callback

  @initialize = (id=null, manager=null) ->
    @id = id
    @collection = new @manager.Collection @id, manager

class Base.View extends Backbone.View

