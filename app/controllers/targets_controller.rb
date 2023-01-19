class TargetsController < ApplicationController
  def show
    @target = Target.find(params[:id])
    @row, @column = params[:selection].split(',').map(&:to_i)
    @correct = @target.row == @row && @target.column == @column
    render json: { correct: @correct }
  end
end
