$ ->
  $('form#filter_track_by_location select').on 'change', ->
    this.form.submit()
