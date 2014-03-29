require 'measurable'

require 'measurable/euclidean_c'

module Measurable
  module C
    def self.included(klass)
      class << klass
        alias_method :euclidean, :euclidean_c
      end
      super
    end
  end

  include Measurable::C
end
