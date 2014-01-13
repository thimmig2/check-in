# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).off('click', "tr").on('click', "tr", ->
  if $(this).attr("data-link")
    window.location = $(this).data("link")
  
)

