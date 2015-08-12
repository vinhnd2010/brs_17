$(document).on "page:change", ->
  $("#comments-link-<%= @comment.review_id %>").click(event) ->
    event.preventDefault()
    $("#comments-section-<%= @comment.review_id %>").fadeToggle()
    $("#comment_body_<%= @comment.review_id %>").focus()
