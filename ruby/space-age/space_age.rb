class SpaceAge
  OTHER_PLANETS = { Mercury: 0.2408467,
                    Venus:   0.61519726,
                    Mars:    1.8808158,
                    Jupiter: 11.862615,
                    Saturn:  29.447498,
                    Uranus:  84.016846,
                    Neptune: 164.79132 }.freeze

  def initialize(seconds)
    @age_in_seconds = seconds
  end

  def on_earth
    @age_in_seconds / (365.25 * 24 * 60 * 60)
  end

  OTHER_PLANETS.each do |planet|
    define_method "on_#{planet.first.downcase}".to_sym do
      on_earth / planet.last
    end
  end
end

module BookKeeping
  VERSION = 1
end
