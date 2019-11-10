
Pod::Spec.new do |s|
  s.name             = 'Singularity'
  s.version          = '1.0.0-alpha.1'
  s.summary          = 'WIP: Singularity Architecture.'
  s.homepage         = 'https://github.com/gsagadyn/Singularity'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Grzegorz Sagadyn' => 'sagadyn@gmail.com' }
  s.source           = { :git => 'https://github.com/gsagadyn/Singularity.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Singularity/Classes/**/*'
  s.swift_versions = '5.1'
end
