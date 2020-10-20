require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :movie_id}
    it { should validate_presence_of :movie_title}
    it { should validate_presence_of :movie_runtime}
    it { should validate_presence_of :date}
    it { should validate_presence_of :duration}
  end

  describe "relationships" do
    it { should have_many :invitations }
    it { should belong_to :user }
  end
end
