# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () ->
  $(".newTerrainButton").click () ->
    # alert "new terrain button!"


# Dropdown JS stolen from http://www.jankoatwarpspeed.com/wp-content/uploads/examples/reinventing-drop-down/#
# then generalized and CoffeeScript-ified.
$ () ->
    getDropDown = (element) ->
        $(element).parents "dl.dropdown"

    $(".dropdown dt a").click (e) ->
        console.debug "Click to open dropdown"
        #$(this).parents("dl.dropdown").find("dd ul").show()
        dropdown = getDropDown this
        dropdown.find("dd ul").show()
        false

    getSelectedValue = (element) ->
        $(element).find("dt a span.value").html()

    $(".dropdown dd ul li a").click () ->
        console.debug "Click on a dropdown item"
        text = $(this).html()
        console.debug "Text is '#{text}'."
        dropdown = getDropDown this
        dropdown.find("dt a span").html text
        dropdown.find("dd ul").hide()
        sib = dropdown.prev().find(".dropdown_result")
        console.debug "Sib is", sib
        dropdown.prev().find(".dropdown_result").val(getSelectedValue dropdown)
        false

    $(document).bind 'click', (e) ->
        $clicked = $(e.target)
        if ! $clicked.parents().hasClass("dropdown")
            console.debug "Cancelled..."
            $(".dropdown dd ul").hide
