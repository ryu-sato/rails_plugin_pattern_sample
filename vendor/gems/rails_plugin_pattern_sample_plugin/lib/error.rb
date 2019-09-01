class Error < StandardError; end
# Your code goes here...

class ProcessorSelectionFailed < StandardError
  def initialize(error_message: nil, found_processors: [])
    @message = error_message || 'Cannot found processor or found more than one.'
    @found_processors = found_processors || []
  end

  def to_s
    "#{@message}\nFound processors: #{@found_processors}"
  end
end
