class Pokemon < ApplicationRecord
  $type_double_damage_from = []
  $type_half_damage_from = []
  $type_no_damage_from = []

  def weaknessestype1
    type1 = Type.find_by(name: self.type_1)
    type1.double_damage_from.each do |type|
      $type_double_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type1.half_damage_from.each do |type|
      $type_half_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type1.no_damage_from.each do |type|
      $type_no_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
  end

  def weaknessestype2
    type2 = Type.find_by(name: self.type_2)
    type2.double_damage_from.each do |type|
      $type_double_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type2.half_damage_from.each do |type|
      $type_half_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type2.no_damage_from.each do |type|
      $type_no_damage_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
  end

  def test
    $type_double_damage_from = []
    weaknessestype1
    if self.type_2.nil? == false
      weaknessestype2
    end
    return $type_double_damage_from
  end

  def weaknesses
    all_types_defense = { bug: 0, dark: 0, dragon: 0, electric: 0, fairy: 0, fighting: 0, fire: 0, flying: 0, ghost: 0, grass: 0, ground: 0, ice: 0, normal: 0, poison: 0,
                          psychic: 0, rock: 0, steel: 0, water: 0 }
  end
end
