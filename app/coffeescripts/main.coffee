require ["game"], (game) ->
  g = new game.Game($('#game')[0], 10)
  setInterval((-> g.draw()), 100)
