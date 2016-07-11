require 'battle_bot'

class Weapon

  attr_reader :name

  def initialize(name, damage = nil)
    raise ArgumentError unless name.is_a?(String)
    raise ArgumentError unless damage.is_a?(Fixnum) || damage == nil
    @name = name
    @damage = damage
    @bot = nil
  end

  def bot=(bot_name)
    raise ArgumentError unless bot_name.is_a?(BattleBot) || bot_name == nil
    @bot = bot_name
  end

  def bot
    @bot
  end

  def picked_up?
    true
  end



end