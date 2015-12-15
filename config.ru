require 'rubygems'
require File.join(File.dirname(__FILE__), './app/app.rb')

run BookmarkManager

ENV['RACK_ENV'] ||= 'development'
