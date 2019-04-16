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
    #check_boxを表示
    button_id = $(this).attr('id')
    check_box_id = button_id.replace('button', 'check_box')
    $('#' + check_box_id).prop 'disabled', false
    $('h4#item_title').html $(this).text()

    #imageを取得
    image_name = $(this).text()
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
    #プリントしたいpathの取得
    doc = document.getElementById('print_image').getAttribute('data')

    if doc.split('.').pop() == 'pdf'
      sub = window.open(doc, null, 'width=500,toolbar=yes,menubar=yes,scrollbars=yes').print()
      sub.close
    else
      #エリア全体を非表示
      $('.print_off').hide()
      #プリントしたい画像を挿入
      $('#print_on').html('<object data="' + doc + '""></object>')
      window.print()
      #window.printの実行後、プリントした画像を削除し、エリアを再表示
      $('#print_on').html("")
      $('.print_off').show()
    return


  $('input#acknowledgment').click ->
    $('td#accept_ack').css 'color', 'Red'
    $('h4#item_title').css 'color', 'Red'
    return

$(document).ready(ready)
$(document).on('page:load', ready)