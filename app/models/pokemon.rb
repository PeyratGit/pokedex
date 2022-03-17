class Pokemon < ApplicationRecord

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

  def weaknesses_double
    $type_double_damage_from.each do |type|
      $all_types_defense[:"#{type}"] += 1
    end
  end

  def weaknesses_half
    $type_half_damage_from.each do |type|
      $all_types_defense[:"#{type}"] -= 1
    end
  end

  def weaknesses_no
    $type_no_damage_from.each do |type|
      $all_types_defense[:"#{type}"] = 0
    end
  end

  def weaknesses
    $type_double_damage_from = []
    $type_half_damage_from = []
    $type_no_damage_from = []
    $all_types_defense = { bug: 2, dark: 2, dragon: 2, electric: 2, fairy: 2, fighting: 2, fire: 2, flying: 2, ghost: 2, grass: 2, ground: 2, ice: 2, normal: 2, poison: 2,
                           psychic: 2, rock: 2, steel: 2, water: 2 }
    weaknessestype1
    if self.type_2.nil? == false
      weaknessestype2
    end
    weaknesses_double
    weaknesses_half
    weaknesses_no
    return $all_types_defense
  end
end
