Linus.Views.Assignments ||= {}

class Linus.Views.Assignments.IndexView extends Backbone.View
  template: JST["backbone/templates/assignments/index"]

  initialize: () ->
    @options.assignments.bind('reset', @addAll)

  addAll: () =>
    @options.assignments.each(@addOne)

  addOne: (assignment) =>
    view = new Linus.Views.Assignments.AssignmentView({model : assignment})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(assignments: @options.assignments.toJSON() ))
    @addAll()

    return this
