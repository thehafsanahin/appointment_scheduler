class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @interactions = Interaction.all
    respond_with(@interactions)
  end

  def show
    respond_with(@interaction)
  end

  def new
    @interaction = Interaction.new
    respond_with(@interaction)
  end

  def edit
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @interaction.save
    respond_with(@interaction)
  end

  def update
    @interaction.update(interaction_params)
    respond_with(@interaction)
  end

  def destroy
    @interaction.destroy
    respond_with(@interaction)
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params[:interaction]
    end
end
