jQuery ->
  $('#course_airport_title').autocomplete
    source: $('#course_airport_title').data('autocomplete-source')
    autoFocus: true
    mustMatch: true

  $('#origin_airport').autocomplete
    source: $('#origin_airport').data('autocomplete-source')
    autoFocus: true
    mustMatch: true

  $('#destination_airport').autocomplete
    source: $('#destination_airport').data('autocomplete-source')
    autoFocus: true
    mustMatch: true
