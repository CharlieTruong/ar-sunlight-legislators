require 'csv'
require_relative '../app/models/legislator'

class LegislatorsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv")
    CSV.table(filename).each do |data|
      Legislator.create(Hash[data])
    end
  end
end