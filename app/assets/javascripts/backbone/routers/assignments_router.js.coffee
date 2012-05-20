class Linus.Routers.AssignmentsRouter extends Backbone.Router
  initialize: (options) ->
    @assignments = new Linus.Collections.AssignmentsCollection()
    @assignments.reset options.assignments

  routes:
    "new"      : "newAssignment"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newAssignment: ->
    @view = new Linus.Views.Assignments.NewView(collection: @assignments)
    $("#assignments").html(@view.render().el)

  index: ->
    @view = new Linus.Views.Assignments.IndexView(assignments: @assignments)
    $("#assignments").html(@view.render().el)

  show: (id) ->
    assignment = @assignments.get(id)

    @view = new Linus.Views.Assignments.ShowView(model: assignment)
    $("#assignments").html(@view.render().el)

  edit: (id) ->
    assignment = @assignments.get(id)

    @view = new Linus.Views.Assignments.EditView(model: assignment)
    $("#assignments").html(@view.render().el)
