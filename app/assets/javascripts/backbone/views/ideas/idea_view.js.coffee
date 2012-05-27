Linus.Views.Ideas ||= {}

class Linus.Views.Ideas.IdeaView extends Backbone.View
  template: JST["backbone/templates/ideas/idea"]

  events:
    "keypress input[type=text]" : "updateOnEnter",
    "click .destroy"            : "destroy",
    "dblclick .view"            : "edit",
    "blur .edit"                : "close"


    #initialize: ->
    #  @model.bind('change', @render)

  tagName: "li"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  edit: () ->
    $(@el).addClass("editing")
    $(".editing .edit").focus()

  close: (e) ->
    e.preventDefault()
    e.stopPropagation()

    value = $(".editing .edit").val()
    @clear unless value
    if value
      @model.save(headline: value)
      $(@el).removeClass("editing")

  updateOnEnter: (e) ->
    return unless e.keyCode is 13
    @close

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
