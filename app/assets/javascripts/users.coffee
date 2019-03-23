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
    button_id = $(this).attr('id')
    check_box_id = button_id.replace('button', 'check_box')
    $('#' + check_box_id).prop 'disabled', false
    $.ajax(
      url:'get_image',
      type:'get',
      data:
          'image_name':image_name
    )
    .done (res) ->
      $('#image').html('<object id="print_image" data="' + res['image'] + '"></object>')
    .fail (err) ->
      console.log err
      $('#image').text('画像を取得できませんでした')
      return
    return

  $('#print_button').click ->
    doc = document.getElementById('print_image').getAttribute('data')
    window.open(doc, 'width=100%').print()
    # window.open(doc)
    # window.print()
    # window.open('','_self').close()

    # $('#image').printThis()
    # $('#image').printPreview()
    return


  # $('.button01').click ->
    # return

$(document).ready(ready)
$(document).on('page:load', ready)