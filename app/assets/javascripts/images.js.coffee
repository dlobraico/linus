jQuery ->
  new ImageCropper()

class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 2.4
      setSelect: [0, 0, 480, 200]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#crop_x').val(coords.x)
    $('#crop_y').val(coords.y)
    $('#crop_w').val(coords.w)
    $('#crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
  	$('#preview').css
  		width: Math.round(480/coords.w * $('#cropbox').width()) + 'px'
  		height: Math.round(200/coords.h * $('#cropbox').height()) + 'px'
  		marginLeft: '-' + Math.round(480/coords.w * coords.x) + 'px'
  		marginTop: '-' + Math.round(200/coords.h * coords.y) + 'px'       
