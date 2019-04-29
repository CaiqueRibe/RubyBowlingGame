require_relative 'Jogo'

class TestGame
  
  Jogo.welcomeScreen
  
  loop do
      jogo = Jogo.new
      jogo.jogar
      break if Jogo.nao_quer_jogar?
   end
  
end

#  Jogo.welcomeScreen
#### welcomeScreen
      


