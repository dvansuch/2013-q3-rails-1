require '../dvc-sinatra.rb'

get "/" do
  @guesses = Guess.all
  @rows = [1, 2, 3, 4, 5]
  @cols = ["A", "B", "C", "D", "E"]
  halt erb(:grid)
end

post "/" do
  @guesses = Guess.all
  @rows = [1, 2, 3, 4, 5]
  @cols = ["A", "B", "C", "D", "E"]

  new_guess = Guess.where(row: params[:row]).where(col: params[:col]).first
  if new_guess != nil
    @error = "Already guessed that"
    halt erb(:grid)
  else
    guess = Guess.new
    guess.row = params[:row]
    guess.col = params[:col]

    ship = Ship.where(row: params[:row], col: params[:col]).first
    if ship != nil
      guess.was_hit = true
    elsif ship == nil
      guess.was_hit = false
    end
  	
    guess.save
  end
  redirect "/"
end
