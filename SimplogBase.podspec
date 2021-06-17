Pod::Spec.new do |spec|
  spec.name         = 'SimplogBase'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/nholloh/Simplog'
  spec.authors      = { 'Niklas Holloh' => 'github@niklasholloh.de' }
  spec.summary      = 'A simplistic, yet extensible iOS logging framework.'
  spec.source       = { :git => 'https://github.com/nholloh/Simplog.git', :tag => 'v0.1.0' }
  spec.source_files = 'Sources/SimplogBase/**/*.swift'
end
