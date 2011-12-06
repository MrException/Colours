define ["board", "underscore"], (b, _) ->

  describe 'Board', ->
    board = null

    beforeEach ->
      board = new b.Board(10)

    it "initializes the board", ->
      expect(board.state instanceof Array).toBeTruthy()
      _.each board.state, (row) ->
        expect(row instanceof Array).toBeTruthy()
