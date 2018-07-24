class Spell < ApplicationRecord

  def self.get_by_level lvl
    spells_of_lvl = []
    self.all.each do |spell|
      if spell.level == lvl
        spells_of_lvl << spell
      end
    end
    spells_of_lvl
  end
end
