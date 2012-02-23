define ["use!underscore", "util", "board"], (_, util, b, d, bu) ->

  class Solver
    constructor: (board) ->
      @board = board.copy()

    solve: ->

    best: ->
      @best
