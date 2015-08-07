jQuery ->
  $("form").on "click", ".remove_fields", (event) ->
    $(this).closest(".field").remove()
    event.preventDefault()

  $("form").on "click", ".add_fields", (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data("id"), "g")
    $(this).before($(this).data("fields").replace(regexp, time))
    event.preventDefault()

  image_base64 = undefined
  $(".form-group .input-group input[type=\"file\"]").change (event) ->
    preview = $("#preview_cover")
    input = $(event.currentTarget)
    file = input[0].files[0]
    reader = new FileReader

    reader.onload = (e) ->
      image_base64 = e.target.result
      preview.attr "src", image_base64
      return

    reader.readAsDataURL file
    return
