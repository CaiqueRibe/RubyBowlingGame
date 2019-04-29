class Jogada

  attr_accessor :pinos
  
  def initialize(pinos)
    @pinos = pinos
  end

  ##teste
  def get_info
    "Pinos  : #{ @pinos }"
  end
  
end

