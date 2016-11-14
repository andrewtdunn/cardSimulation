require_relative 'game'

class Main

  @@filename = "p054_poker.txt"

  def hello
    puts "Hello Ruby!"
  end

  def readFile
    line_num=0
    filename = Dir.pwd + "/" +@@filename
    File.foreach(filename).with_index do |line, line_num|
        game = Game.new(line)

      puts "--------------------------"
      puts "#{line_num}: #{line}"
    end
  end
end



main = Main.new
main.readFile