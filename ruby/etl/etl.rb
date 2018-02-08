require 'pry'
class ETL
  def self.transform(legacy)
    legacy.keys.inject({}) do |shiny, score|
      letters = legacy[score].flatten
      letters.inject(shiny) do |shiny, letter|
        shiny.merge! letter.downcase => score
      end
    end
  end

  def self.transform_old(legacy)
    legacy.keys.inject({}) do |shiny, score|
      letters = legacy[score].flatten
      letters.inject(shiny) do |shiny, letter|
        shiny.merge! letter.downcase => score
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
