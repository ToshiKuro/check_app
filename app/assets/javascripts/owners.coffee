# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $ ->
    if $('#center_top').text() == '＜運航管理者監視画面＞'
      id = setTimeout (->
        location.reload()
        return
      ), 60000
      $('input#source_button').click ->
        clearTimeout id
        return
  return


  # $(window).bind('focus', ->
  #   #フォーカスが当たったらタイマーを設定
  #   if $('#center_top').text() == '＜運航管理者監視画面＞'
  #     timer = setTimeout (->
  #       location.reload()
  #       return
  #     ), 10000
  # ).bind 'blur', ->
  #   #フォーカスが外れたらタイマーを解除
  #   clearTimeout timer
  #   return


  $('.button01').click ->
    #check_boxを表示
    button_id = $(this).attr('id')
    check_box_id = button_id.replace('button', 'check_box')
    $('#' + check_box_id).prop 'disabled', false

    #imageを取得
    image_name = $(this).text()
    $.ajax(
      url:'',
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


$(document).ready(ready)
$(document).on('page:load', ready)