Linus.Views.Assignments ||= {}

class Linus.Views.Assignments.NewView extends Backbone.View
  template: JST["backbone/templates/assignments/new"]

  events:
    "submit #new-assignment": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (assignment) =>
        @model = assignment
        window.location.hash = "/#{@model.id}"

      error: (assignment, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
