# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('div#quantity form').submit (event) ->
    event.preventDefault()
    url = $(this).attr('action')
    new_quantity = $('div#quantity #product_quantity').val()
    $.ajax
      type: 'put'
      url: url
      data: { product: { quantity: new_quantity } }
      dataType: 'json'
      success: (json) ->
        $('#quantity').text(json.quantity).effect('highlight')
