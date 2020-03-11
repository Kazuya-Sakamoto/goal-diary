$(document).on('input: keyup', function(){
  var content = $("#img");
  var images = [];
  var input = []; 
  $('input[type="file"].upload-image:first').attr({
    'data-image':inputs.length
  })
  $each(inputs, function(index, input){
    var input = $(this)
    input.attr({
      'data-image': index 
    })
  })
})
