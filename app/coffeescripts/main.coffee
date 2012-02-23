# Require.js allows us to configure shortcut alias
# There usage will become more apparent futher along in the tutorial.
require.config
  paths:
    use: "/js/requirejs/use-min"
    order: "/js/requirejs/order-min"
    jquery: "/js/jquery-min"
    underscore: "/js/underscore-min"
    backbone: "/js/backbone-min"
    bootstrap: "/js/bootstrap-min"

  use:
    underscore:
      attach: "_"
    backbone:
      deps: ["use!underscore", "jquery"]
      attach: (_, $) ->
        return Backbone
    bootstrap:
      deps: ["jquery"]

# requireing bootstrap here
require ['colours', 'use!bootstrap'], (game) ->
  game.run('#game')
