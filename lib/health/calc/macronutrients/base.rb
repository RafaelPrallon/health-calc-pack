# frozen_string_literal: true

module Health
  module Calc
    module Macronutrients
      # Base class for the calculus of necessary macronutrients
      class Base
        PROTEIN = 1
        FAT = 1
        CARB = 1

        attr_reader :gender, :weight

        def initialize(gender: nil, weight: nil)
          @gender = gender
          @weight = weight
        end

        def calc
          validate_params

          {
            protein: PROTEIN,
            fat: FAT,
            carb: CARB
          }.transform_values { |v| v * weight * gender_multiplier }
        end

        def validate_params
          raise ArgumentError, "need to send gender, height, weight and goal" if [gender, weight].any?(&:nil?)
        end

        def gender_multiplier
          gender == "female" ? 0.8 : 1
        end
      end
    end
  end
end
