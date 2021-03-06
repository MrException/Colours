require 'less'

desc "Generate stylesheets using less"
task :css do
  sh "mkdir -p site/css"

  parser = Less::Parser.new paths: ['./lib/style']
  Dir.glob('app/stylesheets/*less') do |sheet|
    tree = parser.parse(File.read(sheet))

    out = 'site/css/' + sheet.sub(/.*\//, '').sub(/less$/, 'css')
    File.open(out, File::CREAT|File::TRUNC|File::RDWR, 0644) do |f|
      f.write tree.to_css
    end
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

desc "Move all vendor lib files into the site."
task :lib do
  sh "mkdir -p site/js/"
  sh "cp -r lib/js/* site/js/"
end

desc "Move static files into site dir."
task :static do
  sh "cp -r static/* site/"
end

desc "Compile everything"
task default: [:css, :js, :html, :lib, :spec, :static]
