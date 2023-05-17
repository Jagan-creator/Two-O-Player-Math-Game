require_relative 'questions'

class Turn
  attr_reader :player

  def initialize(player)
    @player = player
    @question = Question.new
  end

  def ask_question
    puts "#{player.name}: What is #{@question}?"
    @player_answer = gets.chomp.to_i
  end

  def correct_answer?
    @player_answer == @question.answer
  end
end