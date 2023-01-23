class GamesController < ApplicationController
  def index
    @games = Image.find(params[:image_id]).ranked_games
    render json: @games
  end

  def create
    @image = Image.find(params[:image])
    return head :unprocessable_entity unless @image

    @game = Game.create(image: @image)
    render json: @game, methods: %i[targets], include: %i[image]
  end

  def update
    @game = Game.find(params[:id])
    return update_target if params[:selection] && params[:target]
    return update_player if params[:high_score_token] && (params[:high_score_token] == session[:high_score_token])

    head :unprocessable_entity
  end

  private

  def update_target
    @target = Target.find(params[:target])
    @row, @column = params[:selection].split(',').map(&:to_i)
    return render json: false unless @target.correct?(@row, @column)

    @game.find_target!(@target)
    return render json: @game, target: @target unless @game.just_completed?

    update_completed
  end

  def update_player
    @game.update(params.require(:game).permit(:player))
    render json: @game
  end

  def update_completed
    @game.completed!
    @game_data = @game.as_json(target: @target)

    @game.image.update_rankings

    render json: @game_data.merge(high_score: Game.exists?(@game.id) && generate_high_score_token)
  end

  def generate_high_score_token
    session[:high_score_token] = SecureRandom.urlsafe_base64
  end
end
