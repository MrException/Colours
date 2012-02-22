define ["underscore", "util"], (_, util) ->
  class Board
    constructor: (@size) ->
      @state = new Array(@size)
      @.reset()
      @curColour = @state[0][0]
      @newColour = @curColour
      @

    reset: ->
      l = @size-1
      board = @state
      _.each [0..l], (row, i) ->
        board[i] = new Array(l)
        _.each [0..l], (cell, j) ->
          board[i][j] = Math.round(Math.round(Math.random()*10)/2)
      @

    copy: ->

    print: ->
      b = ""
      _.each @state (row,i) ->
        _.each row, (cell,j) ->
          b += cell
          b += ", " unless j == @size-1
        b += "\n" unless i == @size-1
      console.log b
      @

    select: (c) ->
      if @curColour == c
        return false
      @newColour = c
      @.changeCells 0, 0
      @curColour = @newColour
      true

    changeCells: (x, y) ->
      @state[x][y] = @newColour
      if (x-1 >= 0 and @state[x-1][y] == @curColour)
        @.changeCells x-1, y
      if (y-1 >= 0 and @state[x][y-1] == @curColour)
        @.changeCells x, y-1
      if (x+1 < @size and @state[x+1][y] == @curColour)
        @.changeCells x+1, y
      if (y+1 < @size and @state[x][y+1] == @curColour)
        @.changeCells x, y+1

    done: ->
      # loops through everything, kind of ineficient
      win = true
      _.each @state, (row) =>
        _.each row, (cell) =>
          win = false if cell isnt @curColour
      win

  { Board: Board }
