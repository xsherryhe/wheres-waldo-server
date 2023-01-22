class GamesController < ApplicationController
  def index
    @games = Game.completed.ranked
    render json: @games
  end

  def create
    @image = Image.find(params[:image])
    return head :unprocessable_entity unless @image

    @game = Game.create(image: @image)
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    return update_target if params[:selection] && params[:target]
  end

  private

  def update_target
    @target = Target.find(params[:target])
    @row, @column = params[:selection].split(',').map(&:to_i)
    return render json: false unless @target.correct?(@row, @column)

    @game.game_targets.find_by(target: @target).found!
    return render json: @game unless @game.just_completed?

    update_completed
  end

  def update_completed
    @game.completed!
    @game_data = @game.as_json

    @games = Game.completed.ranked
    @games[10..].each(&:destroy)

    render json: @game_data.merge(high_score: Game.exists?(@game.id) && generate_high_score_token)
  end

  def generate_high_score_token
    session[:high_score_token] = SecureRandom.urlsafe_base64
  end
end
