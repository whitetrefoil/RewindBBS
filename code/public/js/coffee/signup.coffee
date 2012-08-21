"use strict"

init = ->
  $("#notAgreeBtn").click ->
    window.history.back()
  $("#doAgreeBtn").click ->
    step(2)

step = (n) ->
  $("#signUp .content > .content-wrap").hide(0, ->
    $("#signUpStep#{n}").show(0)
  )

$ ->
  init()
