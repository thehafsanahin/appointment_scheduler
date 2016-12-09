class SearchController < ApplicationController
  def index
    @doctors = []
    if params[:q].present?
      searched_results = Doctor.search(params[:q])
      @doctors = searched_results

      if @doctors.empty?
        flash.now.notice = 'Sorry, no doctors found.'
      end
    end
  end


  def autocomplete
    render json: Doctor.search(params[:q], autocomplete: true, limit: 10).map { |doctor| {name: doctor.full_name, value: doctor.id} }
  end
end