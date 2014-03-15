# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'yaml'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

# Can't use MY_ENV in Rakefile
conf = YAML::load_file('./config/environment.yaml')

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'EvernoteTutorialWithRubyMotion'
  app.pods do
    pod 'Evernote-SDK-iOS'
  end
  app.my_env.file = './config/environment.yaml'
  app.info_plist['CFBundleURLTypes'] = [
    {
      'CFBundleURLName' => ["en-#{conf['CONSUMER_KEY']}"]
    }
  ]
end
