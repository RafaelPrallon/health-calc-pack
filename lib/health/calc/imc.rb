# frozen_string_literal: true

module Health
  module Calc
    # Class to do operations regarding the IMC calculation
    class Imc
      def self.calculate_value(weight: nil, height: nil)
        raise ArgumentError, "You need to send both weight and height" if weight.nil? || height.nil?
        raise ArgumentError, "You need to send positive values" if weight.negative? || height.negative?

        weight.to_f / (height * height)
      end

      def self.classification(value)
        return "Low Weight" if value < 18.5
        return "Normal Weight" if value.between?(18.5, 24.9)
        return "Pre-Obese" if value.between?(25, 29.9)
        return "Obesity Level 1" if value.between?(30, 34.9)
        return "Obesity Level 2" if value.between?(35, 39.9)

        "Obesity Level 3"
      end
    end
  end
end
