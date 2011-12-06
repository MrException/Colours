# usage: log('inside coolFunc', this, arguments);
# paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = ->
	log.history = log.history or []
	log.history.push arguments
	console.log(Array::slice.call arguments) if @console
	return
