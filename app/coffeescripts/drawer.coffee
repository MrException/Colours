define ["use!underscore"], (_) ->
  class Drawer
    constructor: (@ctx) ->

    clear: ->
      @ctx.clearRect(0,0,400,500)

    line: (sx,sy,ex,ey) ->
      @ctx.beginPath()
      @ctx.moveTo(sx,sy)
      @ctx.lineTo(ex,ey)
      @ctx.closePath()
      @ctx.stroke()
      @

    squareS: (sx,sy,w,h) ->
      @ctx.beginPath()
      @ctx.rect(sx,sy,w,h)
      @ctx.closePath()
      @ctx.stroke()
      @

    squareF: (sx,sy,w,h,c) ->
      @ctx.fillStyle = c
      @ctx.beginPath()
      @ctx.rect(sx,sy,w,h)
      @ctx.closePath()
      @ctx.stroke()
      @ctx.fill()
      @

    text: (s, x, y) ->
      @ctx.fillStyle = '#000000'
      @ctx.font = '20pt Arial'
      @ctx.fillText(s, x, y)
      @

  { Drawer: Drawer }
