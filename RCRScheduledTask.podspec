Pod::Spec.new do |s|
  s.name             = "RCRScheduledTask"
  s.version          = "1.1.0"
  s.summary          = "A simple facility for running scheduled, repeating tasks within an iOS app using cron-like strings for minutes."
  s.homepage         = "https://github.com/robinsonrc/RCRScheduledTask"
  s.license          = { :type => 'MIT', :file => 'LICENSE'  }
  s.author           = "Rich Robinson"
  s.source           = { :git => "https://github.com/robinsonrc/RCRScheduledTask.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = ['RCRScheduledTask/*.{h,m}']

  s.frameworks = 'Foundation'

  s.dependency 'RCRTimers', '~> 1.1'  
end
