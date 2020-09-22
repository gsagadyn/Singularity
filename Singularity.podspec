Pod::Spec.new do |s|
  s.name             = 'Singularity'
  s.version          = '1.0.1'
  s.summary          = 'Singularity is a lightweight Dependency Injection (DI) framework.'
  s.homepage         = 'https://github.com/gsagadyn/Singularity'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Grzegorz Sagadyn' => 'sagadyn@gmail.com' }
  s.source           = { :git => 'https://github.com/gsagadyn/Singularity.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/**/*'
  s.swift_versions = '5.3'
end
