class SpellsController < ApplicationController
  def index
    @spells = Spell.all
    render json: @spells, status: 200
  end

  def show
    @spells = Spell.get_by_level params[:id].to_i
    render json: @spells, status: 200
  end
end
