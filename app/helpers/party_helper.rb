module PartyHelper
  def party_params
    party_info = Hash.new
    party_info[:movie_id] = params[:movie_id]
    party_info[:movie_title] = params[:movie_title]
    party_info[:movie_runtime] = params[:movie_runtime]
    party_info[:duration] = params[:duration]
    party_info[:date] = party_model_datetime_format
    return party_info
  end

  def party_model_datetime_format
    date = params[:date]
    DateTime.new(date["post(1i)"].to_i, date["post(2i)"].to_i, date["post(3i)"].to_i, date["post(4i)"].to_i, date["post(5i)"].to_i)
  end

  def party_creation(party)
    if party.save
      party.invite(params[:friends]) unless params[:friends].nil?
      flash[:success] = "Party was succesfully created"
      redirect_to users_path
    else
      flash[:error] = party.errors.full_messages.to_sentence
      redirect_to new_party_path
    end
  end
end
