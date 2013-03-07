# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(document).ready ->
    jQuery("#toggle_changes").click ->
      body = document.getElementById("submission_body_editable")
      if $(body).hasClass("CT-hide")
        $(body).removeClass "CT-hide"
      else
        $(body).addClass "CT-hide"

    if (jQuery("#submission_body").val() != "") 
      jQuery("#submission_body_editable").html(jQuery("#submission_body").val())

    jQuery(".editable").hallo
      plugins:
        halloformat: {}
        hallojustify: {}
        hallolists: {}
        halloheadings: {}
        #hallolink: {}
        #halloreundo: {}
        #halloimage: {}
        #halloblacklist: {}

      editable: true
      #toolbar: 'halloToolbarFixed'

    jQuery("#submission_body_editable").blur ->
      jQuery("#submission_body").val(jQuery("#submission_body_editable").html())
    jQuery("#submission_save").click ->
      jQuery("#submission_body").val(jQuery("#submission_body_editable").html())
      jQuery("#submission_clean_body").val(window.tracker.getCleanContent(jQuery("#submission_body_editable").html()))
