$ ->
  $(".notice, .success, .alert").on("click", (event)->
    $(event.target).hide("normal")
  )