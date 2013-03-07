jQuery ->
  new ImageCropper()

class ImageCropper
  constructor: ->
    $('#original').Jcrop
      aspectRatio: 2.4
      setSelect: [0, 0, 480, 200]
      boxWidth: 500
      boxHeight: 500
      bgOpacity: 0.4
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#crop_x').val(coords.x)
    $('#crop_y').val(coords.y)
    $('#crop_w').val(coords.w)
    $('#crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    original = $("#original")
    preview = $("#preview")

    oH = original.height()
    oW = original.width()

    pH = preview.height()
    pW = preview.width()

    rW = pW / coords.w
    rH = pH / coords.h

    preview.css "background-size", (oW * rW) + "px" + " " + (oH * rH) + "px"
    preview.css "background-position", rW * Math.round(coords.x) * -1 + "px" + " " + rH * Math.round(coords.y) * -1 + "px"
