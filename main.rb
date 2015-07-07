Dir["lib/**/*.rb"].each { |file| load file }
require 'pry'

Organizer.new(ARGF.readlines).process
