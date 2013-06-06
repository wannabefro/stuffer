require 'spec_helper'


describe 'stuffing' do

  # it 'works' do
  #   visit '/users/new'
  #   save_and_open_page
  # end


  it 'gets input fields' do
    Stuffer.factorize :user
    Stuffer.get_fields '/users/new'
    Stuffer.fill :name
    click_on 'Create User'

    user = User.last
    expect(user.name).to eql('Stuff')
  end

  it 'gets select boxes' do
    Stuffer.factorize :user
    Stuffer.get_fields '/users/new'
    Stuffer.select :number
    click_on 'Create User'

    user = User.last
    expect(user.number).to eql(23)
  end

  it 'can check a box' do
    Stuffer.factorize :user
    Stuffer.get_fields '/users/new'
    Stuffer.check :stuffed
    click_on 'Create User'

    user = User.last
    expect(user.stuffed).to be_true
  end




end