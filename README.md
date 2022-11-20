# Health::Calc::Pack

Library to do health related calculus made using Ruby and using RSpec for unit testing.
Gem made as part of the Computer Engineering Graduate Course at PUC Minas.

At the moment the available operations are:

- Body mass index (BMI)
- Macronutrients

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'health-calc-pack'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install health-calc-pack

## Usage

Operations:

- BMI related operations are done by the **```Imc```** class.
  - To calculate BMI you use:
    ```
    Health::Calc::Imc.calculate_value(height: your_height, weight: your_weight)
    ```
    - It will return a float with the BMI value
    - You need to send both height and weight and both need to be positive numbers, otherwise it will raise an Argument Error
  - To receive the BMI classification you call:
    ```
    Health::Calc::Imc.classification(bmi_value)
    ```
    - It will return a string with the classification
    - You need to send a number so it returns the correct classification

- Macronutrient related operations are done by the **```CalcMacro```** class using the **```MacroNutrients```** module.
  - To calculate necessary Macronutrients you use:
  ```
    Health::Calc::CalcMacro.new(gender: your_gender, weight: your_weith, goal: your_goal, physical_activity_level: your_physical_activity_level).calc
  ```
    - It will return a hash following the format
        ```
        {
          protein: necessary_protein,
          fat: necessary_fat,
          carb: necessary_carbs
        }
        ```
    - You need to send values for gender, weight, goal, physical_activity_level
      - Weight need to be a number greater than 35
      - The valid values for goal are:
        - Bulking
        - Cutting
        - Maintenance
      - Valid values for gender are male and female, any other value will be treated as male.

    - The currently available strategies for MacroNutrients are:
      - Bulking for people that are highly active physically
      - Bulking in general
      - Cutting
      - Maintenance


## To do

- Add strategies to the Macronutrient module so that we calculate the following:
  - Bulking with average activity
  - Bulking with low activity
  - Cutting with high level of activity
  - Cutting with average level of activity
  - Cutting with low level of activity
  - Maintenance with high level of activity
  - Maintenance with average level of activity
  - Maintenance with low level of activity


- Increase code coverage for **```Imc```** class
- Add code coverage for **```CalcMacro```** class and **```Macronutrients```** module

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RafaelPrallon/health-calc-pack.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
