# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'net/http'

page_num = 1
while page_num < 306
  res = Net::HTTP.get_response(URI("http://www.dnd5eapi.co/api/spells/#{page_num.to_s}"))
  spell_JSON = JSON.parse(res.body)
  #clean clases
  classes = spell_JSON["classes"].map do |c_h|
    c_h["name"]
  end
  #subclasses
  spell_JSON["subclasses"].each do |subclass|
    if subclass["name"] == "Lore"
      classes << "Bard"
    end
    if subclass["name"] == "Land"
      classes << "Druid"
    end
    if subclass["name"] == "Life"
      classes << "Cleric"
    end
    if subclass["name"] == "Devotion"
      classes << "Paladin"
    end
    if subclass["name"] == "Fiend"
      classes << "Warlock"
    end
  end
  classes_str = classes.uniq.join(" ")
  #create new spell instance
  s = Spell.find_or_create_by(
    name: spell_JSON["name"],
    level: spell_JSON["level"],
    page: spell_JSON["page"],
    range: spell_JSON["range"],
    components: spell_JSON["components"].join(" "),
    material: spell_JSON["material"],
    ritual: spell_JSON["ritual"] == 'yes' ? true : false,
    concentration: spell_JSON["concentration"] == 'yes' ? true : false,
    duration: spell_JSON["duration"],
    casting_time: spell_JSON["casting_time"],
    school: spell_JSON["school"]["name"],
    classes: classes_str,
    desc: spell_JSON["desc"].join("||||") || "",
    higher: spell_JSON["higher_level"] == true ? spell_JSON["higher_level"].join("||||") : ""
  )
  page_num += 1
end
