$ ->
  $('form#add_user_practice select').on 'change', ->
    this.form.submit()
