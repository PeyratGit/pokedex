class Pokemon < ApplicationRecord
  has_many :pokemon_stats
  
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
      if $all_types_double_from[:"#{type}"] == 1
        $all_types_double_from[:"#{type}"] *= 2
      else
        $all_types_double_from[:"#{type}"] *= 2
      end
    end
  end

  def weaknesses_half
    $type_half_damage_from.each do |type|
      if $all_types_half_from[:"#{type}"] == 1
        $all_types_half_from[:"#{type}"] = 0.5
      else
        $all_types_half_from[:"#{type}"] = 0.25
      end
    end
  end

  def weaknesses_no
    $type_no_damage_from.each do |type|
      $all_types_no_from[:"#{type}"] = 0
    end
  end

  def weaknesses
    $type_double_damage_from = []
    $type_half_damage_from = []
    $type_no_damage_from = []
    $all_types_defense = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    $all_types_double_from = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    $all_types_half_from = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    $all_types_no_from = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    weaknessestype1
    if self.type_2.nil? == false
      weaknessestype2
    end
    weaknesses_double
    weaknesses_half
    weaknesses_no
    $all_types_defense.each do |key, value|
      $all_types_defense[:"#{key}"] = $all_types_double_from[:"#{key}"] * $all_types_half_from[:"#{key}"] * $all_types_no_from[:"#{key}"]
    end
  end

  def weaknesses_damage_taken
    weaknesses
    return $all_types_defense.select { |type, value| value > 1 }
  end

  def resistances_damage_taken
    weaknesses
    return $all_types_defense.select { |type, value| value < 1 }
  end






  def offensetype1
    type1 = Type.find_by(name: self.type_1)
    type1.double_damage_to.each do |type|
      $type_double_damage_to << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type1.no_damage_to.each do |type|
      $type_no_damage_to << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
  end

  def offensetype2
    type2 = Type.find_by(name: self.type_2)
    type2.double_damage_to.each do |type|
      $type_double_damage_to << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type2.no_damage_to.each do |type|
      $type_no_damage_to << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
  end

  def offense_double
    $type_double_damage_to.each do |type|
        $all_types_double_to[:"#{type}"] *= 2
    end
  end

  def offense_no
    $type_no_damage_to.each do |type|
      $all_types_no_to[:"#{type}"] = 0
    end
  end

  def offense
    $type_double_damage_to = []
    $type_no_damage_to = []
    $all_types_offense = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    $all_types_double_to = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    $all_types_no_to = { bug: 1, dark: 1, dragon: 1, electric: 1, fairy: 1, fighting: 1, fire: 1, flying: 1, ghost: 1, grass: 1, ground: 1, ice: 1, normal: 1, poison: 1,
                           psychic: 1, rock: 1, steel: 1, water: 1 }
    offensetype1
    if self.type_2.nil? == false
      offensetype2
    end
    offense_double
    offense_no
    $all_types_offense.each do |key, value|
      $all_types_offense[:"#{key}"] = $all_types_double_to[:"#{key}"] * $all_types_no_to[:"#{key}"]
    end
  end

  def offense_damage_given
    offense
    return $all_types_offense.select { |type, value| value > 1 }
  end

  def resistances_damage_given
    offense
    return $all_types_offense.select { |type, value| value < 1 }
  end

end
