Pod::Spec.new do |s|
  s.name             = "Notification"
  s.summary          = "UILocalNotification sugar daddy"
  s.version          = "0.2.0"
  s.homepage         = "https://github.com/3lvis/Notification"
  s.license          = 'MIT'
  s.author           = { "Elvis Nuñez" => "elvisnunez@me.com" }
  s.source           = { :git => "https://github.com/3lvis/Notification.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/3lvis'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
end
