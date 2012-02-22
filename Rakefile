require 'less'

desc "Generate stylesheets using less"
task :css do
  parser = Less::Parser.new paths: ['./lib/style']
  Dir.glob('app/stylesheets/*less') do |sheet|
    less = File.new(sheet, 'r')
    tree = parser.parse(less.read)

    out = 'site/css/' + sheet.sub(/.*\//, '').sub(/less$/, 'css')
    f = File.new(out, File::CREAT|File::TRUNC|File::RDWR, 0644)
    f.write tree.to_css
  end
end

desc "Generate javascripts from coffeescripts"
task :js do
  sh "coffee -o site/js/ -c app/coffeescripts/"
end

desc "Generate spec javascripts from coffeescripts"
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
  Dir.glob('lib/*js') do |f|
    sh "cp -r #{f} site/js/"
  end
end

desc "Compile everything"
task default: [:css, :js, :html, :lib, :spec]
