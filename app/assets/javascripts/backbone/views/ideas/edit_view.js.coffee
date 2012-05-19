Linus.Views.Ideas ||= {}

class Linus.Views.Ideas.EditView extends Backbone.View
  template : JST["backbone/templates/ideas/edit"]

  events :
    "submit #edit-idea" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (idea) =>
        @model = idea
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
