Pod::Spec.new do |spec|
  spec.name           = 'SimplogDisabled'
  spec.version        = '0.1.0'
  spec.license        = { :type => 'MIT' }
  spec.homepage       = 'https://github.com/nholloh/Simplog'
  spec.authors        = { 'Niklas Holloh' => 'github@niklasholloh.de' }
  spec.summary        = 'A simplistic, yet extensible iOS logging framework.'
  spec.source         = { :git => 'https://github.com/nholloh/Simplog.git', :tag => 'v0.1.0' }
  spec.source_files   = 'Sources/Simplog/*.swift', 'Sources/SimplogDisabled/*.swift'
  spec.swift_versions = '5.0', '5.1', '5.2', '5.3', '5.4'
  spec.platform       = :ios, '9.0'
  spec.module_name    = "Simplog"
  
  spec.dependency 'SimplogBase'
end
