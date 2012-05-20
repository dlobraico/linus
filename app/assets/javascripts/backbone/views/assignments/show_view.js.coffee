Linus.Views.Assignments ||= {}

class Linus.Views.Assignments.ShowView extends Backbone.View
  template: JST["backbone/templates/assignments/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
