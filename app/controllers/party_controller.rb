class PartyController < ApplicationController
  before_action :require_user
  include PartyHelper

  def new
    movie_info
  end

  def create
    movie_info
    party = @current_user.parties.new(party_params)
    party_creation(party)
  end
end
