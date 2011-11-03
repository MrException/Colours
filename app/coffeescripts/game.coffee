define ["underscore", "board"], (_, board) ->

  class Game
    constructor: (@canvas, size) ->
      @ctx = @canvas.getContext('2d')
      @board = new board.Board(size)
      @cellDim = 300/size

    draw: ->
      @.clear()
      @.square(50,50,300,300)
      x = 50
      y = 50
      _.each @board.state, (row) =>
        _.each row, (c) =>
          @.cell(x,y,@cellDim,@cellDim,c)
          x += @cellDim
        y += @cellDim
        x = 50
      @

    clear: ->
      @ctx.clearRect(0,0,400,400)

    line: (sx,sy,ex,ey) ->
      @ctx.beginPath()
      @ctx.moveTo(sx,sy)
      @ctx.lineTo(ex,ey)
      @ctx.closePath()
      @ctx.stroke()
      @

    square: (sx,sy,w,h) ->
      @ctx.beginPath()
      @ctx.rect(sx,sy,w,h)
      @ctx.closePath()
      @ctx.stroke()
      @

    cell: (sx,sy,w,h,c) ->
      colour = @.colour(c)
      @ctx.fillStyle = colour
      @ctx.beginPath()
      @ctx.rect(sx,sy,w,h)
      @ctx.closePath()
      @ctx.stroke()
      @ctx.fill()
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

  return {
    Game: Game
  }
