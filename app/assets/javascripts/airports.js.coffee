jQuery ->
  $('#course_airport_title').autocomplete
    source: $('#course_airport_title').data('autocomplete-source')
    autoFocus: true
    mustMatch: true
