class PartyController < ApplicationController
  before_action :require_user
  include PartyHelper

  def new
    @movie_id = params[:movie_id]
    @movie_runtime = params[:movie_runtime]
    @movie_title = params[:movie_title]
  end

  def create
    party = @current_user.parties.new(party_params)
    party_creation(party)
  end
end
