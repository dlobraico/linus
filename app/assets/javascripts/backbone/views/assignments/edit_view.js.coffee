Linus.Views.Assignments ||= {}

class Linus.Views.Assignments.EditView extends Backbone.View
  template : JST["backbone/templates/assignments/edit"]

  events :
    "submit #edit-assignment" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (assignment) =>
        @model = assignment
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
