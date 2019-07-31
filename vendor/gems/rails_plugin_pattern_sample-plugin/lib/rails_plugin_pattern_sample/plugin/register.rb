module RailsPluginPatternSample
  module Plugin
    class Register
      def initialize(type)
        @type = type
        @klasses = []
        @required_files = []
      end

      def register(klass, require_file)
        puts 'called register in RailsPluginPatternSample::Plugin::Register'
        @klasses << klass if klass
        @required_files << require_file if require_file
      end
      
      def lookup(params)
        @klasses.select { |proc| processor_match_params?(proc, params) }
      end

      def reload
        required_files = @required_files.dup
        @required_files.clear
        @klasses.clear
        required_files.each do |file|
          load file
        end
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
end