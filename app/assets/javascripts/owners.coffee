# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $ ->
    # development環境
    # if location.href == 'http://localhost:3000/owners/show' || location.href == 'http://localhost:3000/owners/show?'

    # production環境
    if location.href == 'https://web-checklist.herokuapp.com/users/show' || location.href == 'https://web-checklist.herokuapp.com/users/show?'
      id = setTimeout (->
        location.reload()
        return
      ), 10000
      $('input#source_button').click ->
        clearTimeout id
        return
  return

$(document).ready(ready)
$(document).on('page:load', ready)