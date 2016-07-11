require_relative 'weapon'

class BattleBot

  attr_reader :name, :health, :enemies, :weapon

  def initialize(name, damage = nil)
    @name = name || "C3PO"
    @health = 100
    @enemies = []
    @weapon = nil
    @damage = damage
    @dead = false
  end

  def dead?
    if health > 0
      false
    else
      true
    end
  end

  def has_weapon?
    if @weapon != nil
      true
    else
      false
    end
  end

  def take_damage(amount)
    raise ArgumentError unless amount.is_a?(Fixnum)
    @health = @health - amount
    if @health < 0
      @health = 0
    end
    @health
  end

  def pick_up(weapon)
    raise ArgumentError unless weapon.is_a?(Weapon)
    @weapon = weapon
  end

  def drop_weapon
    @weapon = nil
  end

  def heal
    if @health == 0
      @health = @health
    end
    @health = @health + 10
    if @health > 100
      @health = 100
    end
    @health
  end

  def attack(guy)
    raise ArgumentError unless guy.is_a?(BattleBot)
    raise ArgumentError if guy == self
    raise ArgumentError if weapon == nil
    guy.receive_attack_from(self)
  end

  def receive_attack_from(guy)
    raise ArgumentError unless guy.is_a?(BattleBot)
    raise ArgumentError if guy == self
    raise ArgumentError if guy.weapon == nil
    take_damage(guy.weapon.damage)
    @enemies << guy
  end

  def defend_against(enemy)
    dead?
    has_weapon?
  end

  def self.bots
  end

end