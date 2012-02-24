# Colours

This is a really simple, but kind of fun game. I first saw an implementation of
it on Android three years ago. I've implemented it here using JavaScript. I
intend to have two implementations of the rendering part. One which uses canvas
and one which uses a bunch of div elements. Right now the canvas part is
working.

You can see it running by going to http://mrexception.com/projects/colours/

## Usage

Building it requires Rake and a few ruby gems. It also requires the
coffeescript compiler, which requires node. Get ruby up and running, and run
Bundle. Then run Rake to compile it all into the site/ directory. It's then
ready to use from a browser. I also use guard while developing. You can run
guard in the root directory and a web server will be started. You can view the
game by going to http://localhost:3000
