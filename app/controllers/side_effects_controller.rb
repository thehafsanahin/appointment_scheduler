class SideEffectsController < ApplicationController
  before_action :set_side_effect, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @side_effects = SideEffect.all
    respond_with(@side_effects)
  end

  def show
    respond_with(@side_effect)
  end

  def new
    @side_effect = SideEffect.new
    respond_with(@side_effect)
  end

  def edit
  end

  def create
    @side_effect = SideEffect.new(side_effect_params)
    @side_effect.save
    respond_with(@side_effect)
  end

  def update
    @side_effect.update(side_effect_params)
    respond_with(@side_effect)
  end

  def destroy
    @side_effect.destroy
    respond_with(@side_effect)
  end

  private
    def set_side_effect
      @side_effect = SideEffect.find(params[:id])
    end

    def side_effect_params
      params.require(:side_effect).permit(:name, :description)
    end
end
