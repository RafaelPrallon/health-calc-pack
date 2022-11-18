# frozen_string_literal: true

module Health
  module Calc
    # Class to select which strategy to select to calculate
    class CalcMacro
      VALID_GOALS = %w[Bulking Cutting Maintenance].freeze
      attr_reader :gender, :weight, :goal, :physical_activity_level

      def initialize(gender: nil, weight: nil, goal: nil, physical_activity_level: nil)
        @gender = gender
        @weight = weight
        @goal = goal.capitalize
        @physical_activity_level = physical_activity_level.capitalize
      end

      def calc
        validate_params
        strategy = if goal == "Bulking" && physical_activity_level == "Active"
                     Macronutrients::BulkingActive
                   else
                     Macronutrients.get_const(goal)
                   end

        strategy.new(gender: gender, weight: weight).calc
      end

      def validate_params
        if [gender, weight, goal, physical_activity_level].any?(&:nil?)
          raise ArgumentError, "It's necessary to send gender, weight, goal and physical_activity_level"
        end

        raise ArgumentError, "Weight needs to be a number" unless weight.is_a?(Numeric)
        raise ArgumentError, "Weight needs to be greater than 35" unless weight > 35
        raise ArgumentError, "Valid goals are #{VALID_GOALS}" unless VALID_GOALS.include?(goal)
      end
    end
  end
end
