require_relative 'increment.rb'
require 'paint'

class Questioner
  def initialize(questions)
    @questions = questions
  end

  attr_accessor :questions

  def ask(progress_bar)
    answers = []

    @questions.each do |question|
      system("clear")
      puts "#{progress_bar.title}: #{progress_bar.current_step}"
      puts Paint[question, :red]
      answer = gets.chomp
      answers << answer
      puts answers.inspect
      progress_bar.current_step = progress_bar.current_step + 1
    end

    puts "Thanks for answering my questions, you answered with:"
    answers.each do |answer|
      puts answer
    end
  end
end



question_list = [
  "What's your name?",
  "When is your birthday?",
  "Where do you come from?",
  "What is your favorite animal?"
  "Who is your favorite superhero?"
]

my_questioner = Questioner.new(question_list)
progress_bar = ProgressBar.new("Question Progress")

my_questioner.ask(progress_bar)
