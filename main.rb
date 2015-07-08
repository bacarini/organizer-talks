Dir["lib/**/*.rb"].each { |file| load file }

raise Exceptions::OrganizerTalksException, "Error: None file name was given" if ARGF.fileno.zero?

conf = Conference.new(ARGF.readlines)
conf.organize


Report.publish conf.organized_talks
