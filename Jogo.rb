require_relative 'jogada'
require_relative 'frame'

class Jogo
  
  def self.welcomeScreen
    puts "Jogo Iniciado - Seja Bem Vindo!"
    puts "Qual e o seu nome?"
    nome = gets
    puts "Jogo iniciado com sucesso #{nome}"
    puts "Pressione Enter Para Continuar"
    gets
    #Gem.win_platform? ? (system "cls") : (system "clear")
  
  end

  
  def jogar
    
    jogadas = Array.new
    jogadasPC = Array.new
    ##puts
    ##puts
    strike = false
    spare = false
    
    for i in 0..9
      
      jogada_1 = rand(11)
      jogada_2 = rand(11 - jogada_1)
      
      puts "\nFrame ID - #{i}"
      frame = Frame.new(jogada_1,jogada_2)
      puts "TotalFrameUser --> #{frame.get_total}"

      jogadas << jogada_1
      jogadas << jogada_2
      
      jogada_3 = rand(11)
      jogada_4 = rand(11 - jogada_3)
      framePC = Frame.new(jogada_3,jogada_4)
      puts "TotalFramePC --> #{framePC.get_total}"
      
      jogadasPC << jogada_3
      jogadasPC << jogada_4

    end
    
    jogadas[0] = 10
    jogadas[1] = 0
    jogadas[2] = 10
    jogadas[3] = 0
    jogadas[4] = 0


  #  jogadas[19] = 1
    
    #xputs "\nTotal Normal = #{totalPontos}\n\n"
    
    #puts jogadas.inspect
    #puts jogadasPC.inspect
    #jogadas.each_with_index { |val, index| puts "#{val} => #{index}"} 
    puts
    puts "JOGADAS USUARIO\n------------------------------------------------------------------"
    pontuacaoUser = totalizador jogadas
    puts "JOGADAS COMPUTADOR\n-----------------------------------------------------------------"
    pontuacaoPC = totalizador jogadasPC
    
    if pontuacaoUser > pontuacaoPC
      puts "Parabens voce Ganhou! --> #{pontuacaoUser} > #{pontuacaoPC}"
    elsif pontuacaoPC > pontuacaoUser
      puts "Bom jogo, porem o PC Ganhou! --> #{pontuacaoUser} < #{pontuacaoPC}"
    else
      puts "Otima partida, o jogo acabou em um empate -->  #{pontuacaoUser} = #{pontuacaoPC}"
    end
    

  end

  def self.nao_quer_jogar?
      puts "\nDeseja jogar novamente? (S/N)"
      quero_jogar = gets.strip.upcase
      quero_jogar.casecmp('N').zero?
  end
  
  def totalizador(array)
    totalPontos2 = 0
    jogadaPontos = 0
    spareOrStrike = false
    
    puts array.inspect;puts
    #puts
    array.each_with_index do |item, index|
      if spareOrStrike
        spareOrStrike = false
        next
      end
      number = index.to_i
      puts "Index - #{number}      Item - #{item}"
      if array[index] == 10
        if array[index + 2] == 10
          jogadaPontos = 10 + array[index+2].to_i + array[index+4].to_i
          puts"     - DoubleStrike --> 10 + #{array[index+2]} + #{array[index+4]} = #{jogadaPontos}"
        else
          jogadaPontos = 10 + array[index+2].to_i + array[index+3].to_i
          puts"     - Strike --> 10 + #{array[index+2]} + #{array[index+3]} = #{jogadaPontos}"
        end
        spareOrStrike = true
        #puts "strike"
      elsif array[index].to_i + array[index+1].to_i == 10
        jogadaPontos = 10 + array[index+2].to_i
        spareOrStrike = true
        #puts "spare"
        puts"     - Spare --> (#{array[index]} + #{array[index+1]}) = 10 + #{array[index+2]}  = #{jogadaPontos} "  
      else
        jogadaPontos = array[index]
        #puts "   - Pontuacao Nomral --> #{jogadaPontos}"
      end
      totalPontos2 = totalPontos2 + jogadaPontos
      puts "     - PontuacaoTotal --> #{totalPontos2}"
      #puts "Total so far  --> #{totalPontos2}"
      #puts "Index - #{index}    x  Item - #{item}    Proximo - #{array[index+1]}    Proximo - #{array[index+2]}    TotalPontos = #{totalPontos2}"
    end
    # Totalizar Bonuseses
    if array[18] == 10
      extra1 = rand(11)
      #extra1 = 10 
      if extra1 == 10
        extra2 = rand(11)
      else
        extra2 = rand(11 - extra1)
      end
      puts "     - Two Extra Balls  --> #{extra1} + #{extra2}"
      totalPontos2 =  totalPontos2 + extra1 + extra2
    elsif array[18] + array[19] == 10
      extra1 = rand(11)
      puts "     - One Extra Ball --> #{extra1}"
      totalPontos2 =  totalPontos2 + extra1
    end  
    
    puts "-----------------------------\nTOTAL FINAL --> #{totalPontos2}\n-----------------------------\n\n"
    return totalPontos2
  end

   
end



