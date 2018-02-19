module PanelProviders
  class Factory

    def self.make(panel_provider)
      "PanelProviders::#{panel_provider.code.camelize}".constantize.new
    end
  end
end
