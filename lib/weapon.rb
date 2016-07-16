require_relative 'battle_bot'

class Weapon

  attr_reader :name, :damage

  def initialize(name, damage = 0)
    raise ArgumentError unless damage.is_a?(Fixnum) || damage == nil
    raise ArgumentError unless name.is_a?(String)
    @name = name
    @damage = damage
    @bot = nil
  end

  def bot
    @bot
  end

  def bot=(name)
    raise ArgumentError unless name.is_a?(BattleBot) || name == nil
    @bot = name
  end

  def picked_up?
    @bot == nil ? false : true
  end

end