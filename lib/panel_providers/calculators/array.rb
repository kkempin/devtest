module PanelProviders
  module Calculators
    class Array < Base
      NODE_SIZE = 10

      def process(data)
        json = JSON.parse(data)
        counter = (json['docs'].count > NODE_SIZE) ? 1 : 0
        json['docs'].to_a.inject(counter) do |sum, el|
          sum + el.count{ |k, x| (x.class.to_s == 'Array' && x.size > NODE_SIZE) }
        end
      end
    end
  end
end
