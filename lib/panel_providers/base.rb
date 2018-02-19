module PanelProviders
  class Base

    def price
      raise NotImplementedError
    end
  end
end
