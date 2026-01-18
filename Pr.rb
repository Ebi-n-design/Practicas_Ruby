require 'io/console'

# 1. CONFIGURACIÓN
 WIDTH = 20
 HEIGHT = 10
 snake = [[5, 10], [5, 9], [5, 8]]
 direction = [0, 1] # Empezamos yendo a la derecha
 food = [3, 3]
#
# # 2. MÉDODO PARA LEER TECLADO SIN BLOQUEAR
  def read_char
    STDIN.echo = false
      STDIN.raw!
        begin
           # Lee 1 byte si está disponible en el buffer
               if IO.select([STDIN], nil, nil, 0.001)
                     return STDIN.getc.chr
                          end
                            ensure
                                STDIN.echo = true
                                    STDIN.cooked!
                                      end
                                        nil
                                        end
 
#                            # 3. BUCLE PRINCIPAL
                           loop do
#                            # A. DIBUJO
                               system("clear") 
                                puts "Usa WASD para moverte | Q para salir"
                                               
                                HEIGHT.times do |y|
                                 WIDTH.times do |x|
           if snake.first == [y, x]
             print "O" # Cabeza
                                                                         elsif snake.include?([y, x])
              print 'o'  #cuerpo                   
                                                                         elsif food == [y, x]
                     print "X" 

                     else                                                             print "." 
                                                                                end                                                                                                                            end
                                                                           puts "" 
                                                                         end

                                                                                                                                  # B. DETECTAR ENTRADA
                                                                                                                                   input = read_char
                                                                                                                                   case input
                                                                                                                                    when "w" then direction = [-1, 0] unless direction == [1, 0]
                                                                                                                                    when "s" then direction = [1, 0]  unless direction == [-1, 0]
                                                                                                                                    when "a" then direction = [0, -1] unless direction == [0, 1]
                                                                                                                                    when "d" then direction = [0, 1]  unless direction == [0, -1]
                                                                                                                                        when "q" then break
                                                                                                                                       end

                                                                                                                                                # C. LÓGICA DE MOVIMIENTO
                                                                                                                                       new_head = [snake.first[0] + direction[0], snake.first[1] + direction[1]]
                                                                                                                                                     
                                                                                                                                                     # Si la serpiente sale de los límites, termina el juego
                                                                                                                                     if new_head[0] < 0 || new_head[0] >= HEIGHT || new_head[1] < 0 || new_head[1] >= WIDTH
                                                                                                                                       puts "¡GAME OVER! Chocaste con la pared."
                                                                                                                                         break
                                                                                                                                        end
#
                                                                                                                                        snake.unshift(new_head)
                                                                                                                                           snake.pop

                                                                                                                                                            # D. VELOCIDAD
                                                                                                                                           sleep 0.15
                                                                                                                                         end
                                                                                                                                                                          
