Pod::Spec.new do |s|
  s.name             = "LPViewBorderMaker"
  s.version          = "1.0.0"
  s.summary          = "UIView extension of making UIView borders"
  s.description      = <<-DESC
                       UIView extension of making UIView borders via CAGradientLayer
                       DESC
  s.homepage         = "https://github.com/litt1e-p/LPViewBorderMaker"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/LPViewBorderMaker.git", :tag => '1.0.0' }
  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'LPViewBorderMaker/*'
  s.frameworks = 'Foundation', 'UIKit'
end
