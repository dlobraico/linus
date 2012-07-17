# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Ice ||= {}

jQuery(document).ready ->
  if jQuery('body.submissions#edit').length > 0
    Ice.tracker = new ice.InlineChangeEditor(
      element: document.getElementById('submission_body_editable')
      handleEvents: true
      #currentUser:
        #id: 0
        #name: "Default User"
      plugins: [ 
        "IceAddTitlePlugin", 
        "IceSmartQuotesPlugin",
        "IceEmdashPlugin",
        name: "IceCopyPastePlugin"
        settings:
          pasteType: 'formattedClean'
          preserve: "p,a[href],span[id,class]em,strong"
      ]
    ).startTracking()

    Ice.tracker.setCurrentUser
      id: 0
      name: "Default User"

    console.log(Ice.tracker)

    jQuery("#toggle_changes").click ->
      body = document.getElementById("submission_body_editable")
      if $(body).hasClass("CT-hide")
        $(body).removeClass "CT-hide"
      else
        $(body).addClass "CT-hide"

    jQuery("#accept_all").click ->
      Ice.tracker.acceptAll()

    jQuery("#reject_all").click ->
      Ice.tracker.rejectAll()

    jQuery("#acceptChange").click ->
      Ice.tracker.acceptChange()

    jQuery("#rejectChange").click ->
      Ice.tracker.rejectChange()

    if (jQuery("#submission_body").val() != "") 
      jQuery("#submission_body_editable").html(jQuery("#submission_body").val())

    jQuery(".editable").hallo
      plugins:
        halloformat: {}
        hallojustify: {}
        #hallolists: {}
        #halloheadings: {}
        #halloindicator: {}
        #halloblock: {}
        #hallolink: {}
        #halloreundo: {}
        #halloimage: {}

      editable: true
      #toolbar: 'halloToolbarFixed'

    jQuery("#submission_body_editable").blur ->
      jQuery("#submission_body").val(jQuery("#submission_body_editable").html())
    jQuery("#submission_save").click ->
      jQuery("#submission_body").val(jQuery("#submission_body_editable").html())
