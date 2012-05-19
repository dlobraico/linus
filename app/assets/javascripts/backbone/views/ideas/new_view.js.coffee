Linus.Views.Ideas ||= {}

class Linus.Views.Ideas.NewView extends Backbone.View
  template: JST["backbone/templates/ideas/new"]

  events:
    "submit #new-idea": "save"

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
      success: (idea) =>
        @model = idea
        window.location.hash = "/#{@model.id}"

      error: (idea, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
