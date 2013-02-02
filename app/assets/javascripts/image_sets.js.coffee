# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change", ".files_input", () ->
  handleFiles($(".files_input")[0].files)

handleReaderLoad = (evt, dest) ->
  console.debug "Reading into #{dest}!"
  img = document.getElementById(dest)
  img.src = evt.target.result

handleFiles = (files) ->
  offset = 1
  for file in files
    do ->
      local_offset = offset  # freeze value
      reader = new FileReader

      # init the reader event handlers
      reader.onload = (evt) ->
        handleReaderLoad(evt, "preview_#{local_offset}")

      # begin the read operation
      reader.readAsDataURL(file)

      offset++
