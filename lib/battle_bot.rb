require_relative 'weapon'

class BattleBot

  attr_reader :name, :health, :enemies, :weapon

  @@count = 0

  def self.count
    @@count
  end

  def initialize(name)

    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @@count += 1

  end

  def dead?
    @health == 0 ? true : false
  end

  def has_weapon?
    !@weapon.nil?
  end

  def pick_up(weapon)
    raise ArgumentError unless weapon.is_a?(Weapon)
    raise ArgumentError unless weapon.bot == nil
    if @weapon == nil
      @weapon = weapon
      weapon.bot = self
      weapon
    end
  end

  def drop_weapon
    weapon.bot = nil
    @weapon = nil
  end

  def take_damage(amount)
    raise ArgumentError unless amount.is_a?(Fixnum)
    @health -= amount
    if @health <= 0
      @health = 0
      @@count -= 1
    end
    @health
  end

  def heal
    if !dead?
      @health += 10
      @health = 100 if @health > 100
      @health
    end
  end

  def attack(enemy)
    raise ArgumentError unless enemy.is_a?(BattleBot)
    raise ArgumentError if enemy == self
    raise ArgumentError if @weapon == nil
    enemy.receive_attack_from(self)
  end

  def receive_attack_from(enemy)
    raise ArgumentError unless enemy.is_a?(BattleBot)
    raise ArgumentError if enemy == self
    raise ArgumentError if enemy.weapon == nil
    take_damage(enemy.weapon.damage)
    @enemies << enemy unless @enemies.include?(enemy)
    defend_against(enemy)
  end

  def defend_against(enemy)
    raise ArgumentError unless enemy.is_a?(BattleBot)
    attack(enemy) if !dead? && has_weapon?
  end
end



# bot = BattleBot.new("C-3PO")
# light_saber = Weapon.new("LightSaber")
# death_star = Weapon.new("DeathStart", 30)
# enemy = BattleBot.new("R2-D2")