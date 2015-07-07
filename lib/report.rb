module Report
  module_function

  def publish(talks)
    talks.each_with_index do |(key, value), index|
      puts "Track #{index += 1}:"
      value.each do |session, talks|
        send("report_#{session}_session", talks)
      end
      puts "----------------------"
    end
  end

  private
  module_function


  def report_morning_session(talks)
    printout(9, talks)
    puts "12:00 PM - Lunch"
  end

  def report_afternoon_session(talks)
    printout(13, talks)
    puts "05:00 PM - Networking Event"
  end

  def printout(time, talks)
    start = Time.new(2015,07,06,time,00)
    talks.each do |k, v|
      puts "#{start.strftime("%I:%M %p")} - #{k} #{minutes(v)}"
      start = start + v*60
    end
  end

  def minutes(value)
    return 'lightning' if value == 5
    "#{value}min"
  end
end
