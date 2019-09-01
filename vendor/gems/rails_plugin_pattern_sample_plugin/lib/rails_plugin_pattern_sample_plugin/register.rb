module RailsPluginPatternSamplePlugin
  class Register
    def initialize(type)
      puts "@type, @klasses, @required_files: ", @type, @klasses, @required_files
      @type = type
      @klasses = []
      @required_files = []
      puts "initialized RailsPluginPatternSamplePlugin"
    end

    def register(klass, require_file)
      puts "registering #{klass}"
      @klasses << klass if klass
      @required_files << require_file if require_file
    end

    def lookup(params)
      @klasses.select { |klass| processor_match_params?(klass, params) }
    end

    def plugins
      @klasses.dup
    end

    private

    def processor_match_params?(processor, params)
      processor&.match_metadata&.keys&.sort == params&.keys&.sort &&
        params&.all? { |p| p[1].match(processor.match_metadata[p[0]]) }
    end
  end
end
