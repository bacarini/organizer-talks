class Organizer
  attr_accessor :talks

  def initialize(file)
    self.talks = Parser.resolve file
  end

  def process
   f =  first_track
   puts f
   s = second_track
   puts s
   binding.pry
  end

  def shuffle
    Hash[talks.to_a.sample(talks.length)]
  end

  def first_track
    minutes = 0
    talks.each_with_object({}) do |(k, v), hash|
      if minutes + v == 180
        return hash
      elsif minutes + v > 180
        next
      end
      minutes = minutes + v
      hash[k] = v
    end
  end

  def second_track
    minutes = 0
    talks.each_with_object({}) do |(k, v), hash|
      if minutes + v == 180
        return talks - hash
      elsif minutes + v > 180
        next
      end
      minutes = minutes + v
      hash[k] = v
    end
  end
end
