class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = Array.new(10) { alphabet.sample }
  end

  def score
    @word = params[:word]
    response = JSON.parse(Net::HTTP.get(URI("https://wagon-dictionary.herokuapp.com/#{@word}")))
    if response["found"]
      @result = "Congratulations! #{@word} is a valid English word!"
    else
      @result = "Sorry, #{@word} is not a valid English word."
    end
  end
end
