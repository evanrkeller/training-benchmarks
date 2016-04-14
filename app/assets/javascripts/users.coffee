$ ->
  $('form#filter_user_by_track select').on 'change', ->
    this.form.submit()

