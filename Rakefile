desc "Generate stylesheets using compass"
task :css do
  sh "compass compile"
end

desc "Generate javascripts from coffeescripts"
task :js do
  sh "coffee -o site/js/ -c app/coffeescripts/"
end

desc "Generate spc javascripts from coffeescripts"
task :spec do
  sh "coffee -o site/js/spec/ -c spec/"
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
  Dir.glob('lib/*') do |f|
    sh "cp -r #{f} site/js/"
  end
end

desc "Compile everything"
task default: [:css, :js, :html, :lib, :spec]
