module RailsPluginPatternSample
  module Plugin
    class Processor
      @match_metadata = {}

      def self.match_metadata
        @match_metadata
      end
    end
  end
end
