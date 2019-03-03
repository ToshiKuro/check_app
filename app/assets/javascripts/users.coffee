# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('.ack_chk_box').click ->
    if $('#ack_chk_boxes :checked').length == $('input.ack_chk_box').length
      $('#acknowledgment').prop 'disabled', false
    else
      $('#acknowledgment').prop 'disabled', true
    return

  $('.button01').click ->
    image_name = $(this).text()
    $.ajax(
      url:'get_image',
      type:'get',
      data:
          'image_name':image_name
    )
    .done (res) ->
      $('#image').html('<object data="' + res['image'] + '"></object>')
    .fail (err) ->
      console.log err
      $('#image').text('画像を取得できませんでした')
      return
    return


  # $('.button01').click ->
    # return

$(document).ready(ready)
$(document).on('page:load', ready)