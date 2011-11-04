desc "Generate stylesheets using compass"
task :css do
  sh "compass compile"
end

desc "Generate javascripts from coffeescripts"
task :js do
  sh "coffee -o site/js/ -c app/coffeescripts/"
end

desc "Generate html from haml"
task :html do
  Dir.glob('**/*.haml') do |f|
    out = 'site/' + f.sub(/.*\//, '').sub(/.haml$/, '')
    sh "haml #{f} #{out}"
  end
end

desc "Move all external JS lib files into the site"
task :lib do
  Dir.glob('lib/*.js') do |f|
    cp f, 'site/js/'
  end
end

desc "Compile everything"
task default: [:css, :js, :html]
