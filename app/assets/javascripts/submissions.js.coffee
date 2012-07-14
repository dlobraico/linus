# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(document).ready ->
  #tracker = new ice.InlineChangeEditor(
    #element: document.getElementById("submission")
    #handleEvents: true
    #currentUser:
      #id: 1
      #name: "DJ LoBraico"

      #plugins: [ 
        #"IceAddTitlePlugin", 
        #"IceEmdashPlugin",
        #name: "IceCopyPastePlugin"
        #settings:
          #preserve: "p,a[href],span[id,class]em,strong"
      #]
  #).startTracking()

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
    toolbar: 'halloToolbarFixed'
