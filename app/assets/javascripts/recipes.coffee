search_content = ->
  $.map $('.recipes .item'), (el, idx) ->
    { title: $(el).find('.header').text(), description: $(el).find('.description').text(), id: $(el).attr('data-recipe-id') }

$(document).on "turbolinks:load", ->
  $('.rating').rating('disable')

  $('.ui.search').search({
    source: search_content(),
    searchFields: [ 'title', 'description' ],

    cache: false,
    searchFullText: true,

    maxResults: 0,

    type: 'noresults',
    templates: {
      noresults: (response) ->
        console.log 'noresults'
        return ''
    },

    # onSearch: (query) ->
    #   $.each $('.recipes .item'), (idx, el) ->
    #     $(el).show()

    onResults: (results) ->
      query = $(this).find('input').val().toLowerCase()
      show_ids = new Set()

      $.each results.results, (idx, result) ->
        if result.title.toLowerCase().includes(query) or result.description.toLowerCase().includes(query)
          show_ids.add(result.id)

      $.each $('.recipes .item'), (idx, el) ->
        if show_ids.has($(el).attr('data-recipe-id'))
          $(el).show()
        else
          $(el).hide()

    onSelect: (result, response) ->
      console.log "selected: " + result.title
      return false
  })