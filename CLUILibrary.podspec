Pod::Spec.new do |s|  
  s.name             = "CLUILibrary" 
  s.version          = "0.1.3"  
  s.summary          = "UILibrary"  
  s.description  = <<-DESC
 			collection some control,effect,usually function
			1.PostionExtension easy use frame property, just uiview.width,view.left
                   DESC
  s.homepage         = "https://github.com/mclkyo/CLUILibrary"  
  s.license          = "MIT"  
  s.author           = { "mclkyo" => "mclkyo@gmail.com" }  
  s.source           = { :git => "https://github.com/mclkyo/CLUILibrary.git", :tag => "0.1.3"}  
  s.platform     = :ios, "7.0"  
  s.requires_arc = true  
  s.source_files = "Libs/**/*.{h,m}"

  
end