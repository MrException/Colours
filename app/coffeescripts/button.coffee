define ["underscore", "util"], (_, util) ->

  class Button
    constructor: (@drawer, @x, @y, @c) ->
      @width = 60
      @height = 25

    draw: ->
      @drawer.squareF(@x, @y, @width, @height, util.colour(@c))

    isClicked: (x, y) ->
      if x>=@x and x<=@x+@width and y>=@y and y<=@y+@height
        true
      else
        false

   { Button: Button }
