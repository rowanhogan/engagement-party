#= require 'jquery'
#= require_tree './templates'

$ ->

  # Example template
  # $("#twitter").append JST["templates/tweet"](data)


$(document).on 'click', '#map-link', (e) ->
  console.log 'woo'
  e.preventDefault()
  $('.map-box').show()
  mapbox.auto('map', 'rowanhogan.map-7belist9');

$(document).on 'click', '#map-close', (e) ->
  e.preventDefault()
  $('.map-box').hide()
