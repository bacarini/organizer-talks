module Parser
  module_function

  def resolve(file)
    file.each_with_object({}) do |line, hash|
      hash[talk_from(line).strip!] = minutes_from(line)
    end
  end

  private
  module_function

  def talk_from(line)
    if lightning?(line)
      line.match(/(\D+)(lightning)/i).captures.first
    else
      line.match(/(\D+)/i).captures.first
    end
  end

  def minutes_from(line)
    lightning?(line) ? 5 : line.scan(/\d+/).first.to_i
  end

  def lightning?(line)
    line =~ /lightning/
  end
end
