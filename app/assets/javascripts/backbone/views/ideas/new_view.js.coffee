Linus.Views.Ideas ||= {}

class Linus.Views.Ideas.NewView extends Backbone.View
  template: JST["backbone/templates/ideas/new"]

  events:
    "submit #new-idea": "save"
    "keypress input[type=text]": "saveOnEnter"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  saveOnEnter: (e) ->
    return unless e.keyCode is 13
    @save(e)

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    headline = @$("#new-idea #headline").val()
    if headline
      @$("input#headline").val ''
      @collection.create(headline: headline)

      #    @model.unset("errors")
      #
      #    @collection.create(@model.toJSON(),
      #      success: (idea) =>
      #        @model = idea
      #
      #      error: (idea, jqXHR) =>
      #        @model.set({errors: $.parseJSON(jqXHR.responseText)})
      #    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
