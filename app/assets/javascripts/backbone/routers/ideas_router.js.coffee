class Linus.Routers.IdeasRouter extends Backbone.Router
  initialize: (options) ->
    @ideas = new Linus.Collections.IdeasCollection()
    @ideas.reset options.ideas

  routes:
    "new"      : "newIdea"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newIdea: ->
    @view = new Linus.Views.Ideas.NewView(collection: @ideas)
    $("#ideas").html(@view.render().el)

  index: ->
    @view = new Linus.Views.Ideas.NewView(collection: @ideas)
    $("#new-idea").html(@view.render().el)
    @view = new Linus.Views.Ideas.IndexView(ideas: @ideas)
    $("#ideas").html(@view.render().el)

  show: (id) ->
    idea = @ideas.get(id)

    @view = new Linus.Views.Ideas.ShowView(model: idea)
    $("#ideas").html(@view.render().el)

  edit: (id) ->
    idea = @ideas.get(id)

    @view = new Linus.Views.Ideas.EditView(model: idea)
    $("#ideas").html(@view.render().el)
