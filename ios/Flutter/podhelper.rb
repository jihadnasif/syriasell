require 'fileutils'

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', '..', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter build ios was run first."
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter build ios again."
end

def flutter_podhelper_path
  File.expand_path(File.join(flutter_root, 'packages', 'flutter_tools', 'bin', 'podhelper.rb'))
end

load flutter_podhelper_path
