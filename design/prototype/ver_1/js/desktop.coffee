"use strict"

$ ->
  $(".block-label").click ->
    $(this).toggleClass("block-label-collapsed").parent().siblings("section").first().toggleClass("collapsed")
