# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

search_content = [
  { title: 'Andorra', description: 'lemon, sugar' },
  { title: 'Blort', description: 'crud, bung'  },
  { title: 'Fung', description: 'onions, ladders' },
]

$(document).on "turbolinks:load", ->
  $('.rating').rating('disable')

  $('.ui.search').search({
    source: search_content,
    searchFields: [ 'title', 'description' ],
    onResults: (results) ->
      $.each results.results, (idx, result) ->
        console.log "result: " + result.title
    onSelect: (result, response) ->
      console.log "selected: " + result.title
      return false
  })