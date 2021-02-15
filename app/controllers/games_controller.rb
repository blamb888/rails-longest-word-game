require 'open-uri'
class GamesController < ApplicationController
  def new
    # TODO: display a new random grid and a form
    @letters = 8.times.map { ('A'..'Z').to_a.sample } + 2.times.map { ['E','O', 'U', 'A', 'I'].sample }
  end

  def score
    # The form will be submitted (with POST) to the score action.
    # start_time = Time.now
    # end_time = Time.now
    @message = ''
    # @time = end_time - start_time
    guess = params[:guess]
    @score = guess.length.to_i * 10
    grid = params[:letters].split
    if !guess(guess)
      @message = "#{params[:guess]} is not an english word"
      @score = 0
    elsif !in_the_grid?(guess, grid)
      @message = "not in the grid."
      @score = 0
    else
      @message = "Well Done!"
      @score
    end
  end

  private

    def guess(guess)
      url = "https://wagon-dictionary.herokuapp.com/#{params[:guess]}"
      user_test = open(url).read
      user_attempt = JSON.parse(user_test)
      user_attempt["found"]
    end

    def in_the_grid?(guess, grid)

      guess.upcase!
      guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
    end

end
