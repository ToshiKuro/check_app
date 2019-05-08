# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# ready = ->

#   $ ->
#     if $('#center_top').text() == '＜運航管理者監視画面＞'
#       id = setInterval (->
#         location.reload()
#         $.ajax
#           url: 'get_source'
#           type: 'get'
#           success: (data) ->
#             alert 'success'
#             return
#           error: (data) ->
#             alert 'errror'
#             return
#         return
#       ), 120000
#       $('input#source_button').click ->
#         clearInterval id
#         return
#   return

# $(document).ready(ready)
# $(document).on('page:load', ready)