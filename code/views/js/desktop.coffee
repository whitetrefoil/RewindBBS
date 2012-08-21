"use strict"

$ ->
  $(".block>header>h2").click ->
    $(this).toggleClass("collapsed").parent().siblings(".content").first().toggleClass("content-collapsed")
