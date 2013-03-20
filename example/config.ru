require "bundler"
Bundler.require

run Slyde::App.new("presentation.md")
