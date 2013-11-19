# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#problem_tabs a[href=\"#problem\"]").click (e) ->
    e.preventDefault()
    $(this).tab "show"

  $("#problem_tabs a[href=\"#submission\"]").click (e) ->
    e.preventDefault()
    $("#problem_tabs a[href=\"#submission\"]").tab "show"


  $("#new_submission").submit (e) ->
    e.preventDefault()
    valuesToSubmit = $(this).serialize()
    #sumbits it to the given url of the form
    # you want a difference between normal and ajax-calls, and json is standard
    $.ajax(
      url: $(this).attr("action")
      type: "POST"
      data: valuesToSubmit
      dataType: "JSON"
    ).success (submission_result) ->
      doPoll(submission_result.id)
    true
    #act on result.
    false # prevents normal behaviour

  true

doPoll = (submission_result_id) ->
  $.get "/submission_results/" + submission_result_id + ".json", (data) ->
    $("#submission_status").removeClass()
    $("#submission_status").html(data.details)
    if data.completed
      $("#submission_status").addClass("alert alert-success")
    else
      $("#submission_status").addClass("alert alert-info")
      $.doTimeout 1000, ->
        doPoll submission_result_id
