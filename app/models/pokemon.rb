class Pokemon < ApplicationRecord
  @type_double_from = []
  @type_half_from = []
  @type_no_from = []

  def weaknessestype1
    type1 = Type.find_by(name: self.type_1)
    type1.double_damage_from.each do |type|
      @type_double_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type1.half_damage_from.each do |type|
      @type_half_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
    type1.no_damage_from.each do |type|
      @type_no_from << type.scan(/name.{1}=>.{1}([a-zA-Z]+)/)[0][0]
    end
  end

  def weaknessestype2
    type2 = Type.find_by(name: self.type_2)
  end
end
