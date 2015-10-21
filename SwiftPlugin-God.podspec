Pod::Spec.new do |spec|
  spec.name = 'SwiftPlugin-God'
  spec.version = '1.1.4'
  spec.summary = 'SwiftPlugin-God'
  spec.homepage = 'https://github.com/ryanchang0827/SwiftPlugin-God'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Chi Chang' => 'gn02772717@gmail.com' }
  spec.source = { :git => 'https://github.com/ryanchang0827/SwiftPlugin-God.git', :tag => "#{spec.version}" }
  spec.source_files = 'SwiftPlugin-God/*.swift'
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true
end