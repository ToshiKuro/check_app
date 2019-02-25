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

$(document).ready(ready)
$(document).on('page:load', ready)