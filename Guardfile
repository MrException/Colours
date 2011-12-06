guard 'livereload' do
  watch %r{^site/(.*)}
end

guard 'haml', output: 'site' do
  watch %r{^app/.+(\.html\.haml)}
  watch %r{^spec/.+(\.html\.haml)}
end

guard 'compass', output: 'site/css' do
  watch %r{^app/stylesheets/(.*)\.scss}
end

guard 'coffeescript', output: 'site/js' do
  watch %r{^app/coffeescripts/(.*)\.coffee}
  watch %r{^(spec/.*).coffee}
end

guard 'webrick', docroot: 'site'
