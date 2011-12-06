define ["underscore", "board", "drawer"], (_, b, d) ->

  class Game
    constructor: (@canvas, size) ->
      @ctx = @canvas.getContext('2d')
      @board = new b.Board(size)
      @drawer = new d.Drawer(@ctx)
      @cellDim = 300/size

    draw: ->
      @drawer.clear()
      @drawer.squareS(50,50,300,300)
      x = 50
      y = 50
      _.each @board.state, (row) =>
        _.each row, (c) =>
          @drawer.squareF(x, y, @cellDim, @cellDim, @.colour(c))
          x += @cellDim
        y += @cellDim
        x = 50
      @

    colour: (n) ->
      switch n
        when 0 then "#FF0000" #red
        when 1 then "#00FF00" #green
        when 2 then "#0000FF" #blue
        when 3 then "#000000" #black
        when 4 then "#FFFFFF" #white
        when 5 then "#FFFB00" #yellow
        else console.log "Bad colour?!"

  run = (canvas) ->
    game = new Game(canvas, 10)
    return setInterval((-> game.draw()), 100)

  return {
    run: run,
    Game: Game
  }
