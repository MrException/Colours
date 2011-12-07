define [], () ->
  colour = (n) ->
    switch n
      when 0 then "#FF0000" #red
      when 1 then "#00FF00" #green
      when 2 then "#0000FF" #blue
      when 3 then "#000000" #black
      when 4 then "#FFFFFF" #white
      when 5 then "#FFFB00" #yellow
      else log "Bad colour?!"

  log = ->
    window.log = window.log or {}
    window.log.history = window.log.history or []
    window.log.history.push arguments
    console.log(Array::slice.call arguments) if console

  getPos = (e, canvas) ->
    x=0
    y=0
    if e.pageX or e.pageY
      x = e.pageX
      y = e.pageY
    else
      x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft
      y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop
    x -= canvas.offsetLeft
    y -= canvas.offsetTop
    [x,y]

  {
    colour: colour,
    log: log,
    getPos: getPos
  }

