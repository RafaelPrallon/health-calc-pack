# frozen_string_literal: true

module Health
  module Calc
    module Macronutrients
      # Class for the calculus of necessary macronutrients for a active person with a bulking strategy
      class BulkingActive < Base
        PROTEIN = 2
        FAT = 2
        CARB = 7
      end
    end
  end
end
