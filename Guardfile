guard 'livereload' do
  watch %r{^site/(.*)}
end

guard 'haml', output: 'site', input: 'app' do
  watch %r{^app/.+(\.html\.haml)}
end

guard 'compass', input: 'app/stylesheets', output: 'site/css' do
  watch %r{^app/stylesheets/(.*)\.scss}
end

guard 'coffeescript', input: 'app/coffeescripts', output: 'site/js'

guard 'webrick', docroot: 'site' do
end
