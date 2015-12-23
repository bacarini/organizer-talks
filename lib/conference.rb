class Conference
  attr_accessor :talks, :organized_talks, :tracks_number

  def initialize(file, tracks_number = 2)
    self.talks = Parser.resolve file
    self.tracks_number = tracks_number
  end

  def organize
   self.organized_talks = Organizer.process talks, tracks_number
  end

  def shuffled_talks
    Hash[talks.to_a.shuffle]
  end
end
