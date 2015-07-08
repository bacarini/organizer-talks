module Organizer
  module_function
  SESSION_TIME = {morning: 180, afternoon: 240}

  def process(talks, tracks_number)
    raise(
      Exceptions::OrganizerTalksException,
      "Error: None tracks number was given"
    ) unless tracks_number > 0

    {}.tap do |tracks|
      tracks_number.times { |index| tracks[index] = find_best_track(talks) }
      raise(
        Exceptions::OrganizerTalksException,
        "Error: The sum of talks duration exceeded time available"
      ) unless talks.empty?
    end
  end

  private
  module_function

  def find_best_track(talks)
    SESSION_TIME.each_with_object({}) do |(session, time), new_track|
      new_track[session] = find_session time, talks
      reject! new_track[session], talks
    end
  end

  def find_session(time, talks)
    minutes = 0
    talks.each_with_object({}) do |(talk, duration), hash|
      tmp = minutes + duration
      next if tmp > time

      hash[talk], minutes = duration, tmp

      return hash if tmp == time
    end
  end

  def reject!(list, talks)
    talks.delete_if { |k,_| list.keys.include? k }
  end
end
