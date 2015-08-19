require 'bundler/setup'
Bundler.require(:default, :development)
$: << '.'
(Dir['../app/data_fetchers/*.rb'] + Dir["../app/runners/*.rb"]).each { |path| Dir.glob(path, &method(:require))}

# require "open-uri"
# require "json"