Pod::Spec.new do |s|
  s.name                = "M3U8Kit"
  s.version             = "1.0"
  s.summary             = "HLS .m3u8 file parser."
  s.homepage            = "https://github.com/Jeanvf/M3U8Paser"
  s.license             = { :type => "as-is", :file => "LICENSE" }
  s.author              = { "Jeanvf" => "jeansunvf@gmail.com" }
  s.source              = { :git => "https://github.com/Jeanvf/M3U8Paser.git", :tag => "v1.0" }
  s.source_files        = "M3U8Kit", "M3U8Kit/**/*.{h,m}"
  s.prefix_header_file  = "M3U8Kit/M3U8Kit-Prefix.pch"
  s.requires_arc        = true
end
