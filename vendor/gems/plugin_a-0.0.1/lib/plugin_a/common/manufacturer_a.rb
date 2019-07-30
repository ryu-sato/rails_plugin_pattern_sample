module PluginA
  class ManufacturerA
    MATCH_METADATA = {
      manufacturer: 'B',
      test: 'hoge'
    }

    def match_metadata
      MATCH_METADATA
    end
  end
end
