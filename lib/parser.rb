module Parser
  module_function

  def resolve(file)
    file.each_with_object({}) do |line, hash|
      talk, time = line.match(/(.*?)\s+(lightning|\d+)(?:min|$)/).captures
      raise(
        Exceptions::OrganizerTalksException,
        "Error: Talk: #{talk} is repeated"
      ) if hash.include? talk

      hash[talk] = minutes_from(time)
    end
  rescue NoMethodError
    raise Exceptions::OrganizerTalksException, "Error: Please check your input and try again!"
  end

  private
  module_function

  def minutes_from(time)
    time =~ /lightning/ ? 5 : time.to_i
  end
end
