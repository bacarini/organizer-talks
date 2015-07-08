module Exceptions
  class OrganizerTalksException < Exception
    attr_accessor :message

    def initialize(message)
      self.message = message
    end
  end
end
