# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $ ->
    if location.href == 'http://localhost:3000/owners/show?'
      setTimeout (->
        location.reload()
        return
      ), 10000
  return

$(document).ready(ready)
$(document).on('page:load', ready)

