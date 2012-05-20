Linus.Views.Ideas ||= {}

class Linus.Views.Ideas.IdeaView extends Backbone.View
  template: JST["backbone/templates/ideas/idea"]

  events:
    "keypress input[type=text]" : "updateOnEnter",
    "click .destroy"            : "destroy",
    "dblclick .view"            : "edit",
    "blur .edit"                : "close"


    #  initialize: ->
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
    console.log("4")
    e.preventDefault()
    e.stopPropagation()
    console.log("5")

    value = $(".editing .edit").val()
    @clear unless value
    console.log("6")
    if value
      @model.save(headline: value)
      $(@el).removeClass("editing")
    console.log("7")

  updateOnEnter: (e) ->
    console.log("1")
    return unless e.keyCode is 13
    console.log("2")
    @close
    console.log("3")

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
