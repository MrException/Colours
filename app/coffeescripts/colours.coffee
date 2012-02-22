define ["underscore", "util", "board", "drawer", "button"], (_, util, b, d, bu) ->

  class Game
    constructor: (canvasName, size) ->
      # get canvas context, and set up the drawer
      @canvas = $(canvasName)[0]
      @ctx = @canvas.getContext('2d')
      @drawer = new d.Drawer(@ctx)

      @board = new b.Board(size)
      @cellDim = 300/size
      @.initButtons()
      @clicks = 0

      # set up the handler for mouse clicks
      $(canvasName).on("click", { game: @ }, @.click)

    initButtons: ->
      @buttons = []
      _.each [0,1,2,3,4,5], (c) =>
        if c < 3
          but = new bu.Button(@drawer, 50+(120*(c)), 375, c)
        else
          but = new bu.Button(@drawer, 50+(120*(c-3)), 425, c)
        @buttons.push(but)
      @

    draw: ->
      @drawer.clear()
      if @board.done()
        @drawer.text("WINNER!", 50, 270)
      else
        @drawer.text("Moves: " + @clicks.toString(), 0, 20)
        @drawer.squareS(50,50,300,300)
        x = 50
        y = 50
        _.each @board.state, (row) =>
          _.each row, (c) =>
            @drawer.squareF(x, y, @cellDim, @cellDim, util.colour(c))
            x += @cellDim
          y += @cellDim
          x = 50
        _.each @buttons, (but) =>
          but.draw()
      @

    click: (e) ->
      game = e.data.game
      [x,y] = util.getPos(e, game.canvas)
      _.each game.buttons, (but) =>
        if but.isClicked(x, y)
          game.clicks++ if game.board.select(but.c)


  run = (canvasName) ->
    game = new Game(canvasName, 10)
    setInterval((-> game.draw()), 100)

  {
    run: run,
    Game: Game
  }
