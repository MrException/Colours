guard 'livereload', host: '127.0.0.1', port: '35729' do
  watch(%r{^site/(.*)}) { |m| m[1] }
end

guard 'haml', output: 'site', input: 'app' do
  watch %r{^app/(.+\.html)\.haml}
  watch %r{^spec/(.+\.html)\.haml}
end

guard 'less', output: 'site/css', import_paths: ['lib/style'] do
  watch %r{^app/stylesheets/(.*)\.less}
end

guard 'coffeescript', output: 'site/js' do
  watch %r{^app/coffeescripts/(.*)\.coffee}
  watch %r{^(spec/.*).coffee}
end

guard 'webrick', docroot: 'site'
