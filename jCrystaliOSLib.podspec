Pod::Spec.new do |spec|
  spec.name         = "jCrystaliOSLib"
  spec.version      = "0.0.1"
  spec.summary      = "jCrystal Swift library"

  spec.description  = <<-DESC
                      jCrystal Swift libreary provides helpers to cnnect to jCrystal backends, as well as useful extension for creating iOS apps. 
                      DESC

  spec.homepage     = "https://crystaltechsas.github.io/jcrystal_documentation/clients/ios.html"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             =  "Germán Sotelo"
  spec.swift_version = "4.2"
  spec.platform = :ios, "9.0"
  spec.source       = { :git => "https://github.com/CrystalTechSAS/jCrystaliOSLib.git", :tag => "#{spec.version}" }

  spec.source_files  = ["jCrystaliOSLib/**/*.swift", "jCrystaliOSLib/jCrystaliOSLib.ht"]

end
