
class Fighter

  DEFAULT_HP = 20

  def initialize name, hp = DEFAULT_HP
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= Random.new.rand(1..3)
    @hp = 0 if @hp < 0
  end

  def receive_whirlwind_damage
    @hp -= 5 
    @hp = 0 if @hp < 0
  end



  attr_accessor :hp, :name

end
