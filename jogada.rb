class Jogada

  attr_accessor :pinos
  
  def initialize(pinos)
    @pinos = pinos
  end

  
  def get_info
    "Pinos : #{ @pinos }"
  end
  
end

