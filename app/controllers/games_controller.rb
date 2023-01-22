class GamesController < ApplicationController
  def create
    @image = Image.find(params[:image])
    return head :unprocessable_entity unless @image

    @game = Game.create(image: @image)
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    return update_target if params[:selection]
  end

  private

  def update_target
    @target = Target.find(params[:target])
    @row, @column = params[:selection].split(',').map(&:to_i)
    return render json: false unless @target.correct?(@row, @column)

    @game.game_targets.find_by(target: @target).found!
    return render json: @game unless @game.completed_by_targets?

    update_completed
  end

  def update_completed
    @game.completed!

    @last_game = Game.completed.order(completion_time: :desc, updated_at: :desc).first
    @current_game = @game.as_json

    @last_game.destroy
    @current_game.merge!(high_score: true) unless @game.destroyed?

    render json: @current_game
  end
end
