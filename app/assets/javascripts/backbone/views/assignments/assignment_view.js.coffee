Linus.Views.Assignments ||= {}

class Linus.Views.Assignments.AssignmentView extends Backbone.View
  template: JST["backbone/templates/assignments/assignment"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
