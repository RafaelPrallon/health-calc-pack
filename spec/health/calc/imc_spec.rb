# frozen_string_literal: true

require "spec_helper"

RSpec.describe Health::Calc::Imc do
  describe ".calculate_value" do
    let(:weight) { 70 }
    let(:height) { 2 }

    %i[weight height].each do |key|
      context "#{key} is nil" do
        let(key) { nil }

        it "raises an error about lack of attribute" do
          expect do
            described_class.calculate_value(weight: weight, height: height)
          end.to raise_error(ArgumentError, "You need to send both weight and height")
        end
      end

      context "#{key} is negative" do
        let(key) { -2 }

        it "raises an error about negative value of attribute" do
          expect do
            described_class.calculate_value(weight: weight, height: height)
          end.to raise_error(ArgumentError, "You need to send positive values")
        end
      end
    end

    it "returns expected value" do
      expect(described_class.calculate_value(weight: weight, height: height)).to eq(17.5)
    end
  end

  describe ".classification" do
    {
      "Low Weight" => 18,
      "Normal Weight" => 20,
      "Pre-Obese" => 26,
      "Obesity Level 1" => 33,
      "Obesity Level 2" => 38,
      "Obesity Level 3" => 60
    }.each do |category, imc|
      context "it's within range of #{category}" do
        it { expect(described_class.classification(imc)).to eq(category) }
      end
    end
  end
end
