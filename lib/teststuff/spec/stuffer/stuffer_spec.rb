require 'spec_helper'


describe 'stuffing' do
  it 'gets fields' do
    Stuffer.factorize :user
    puts Stuffer.get_fields '/users/new'

  end
end