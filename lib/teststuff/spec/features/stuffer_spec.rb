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

  it 'can select a radio button' do
    Stuffer.factorize :user
    Stuffer.get_fields '/users/new'
    Stuffer.radio :food
    click_on 'Create User'

    user = User.last
    expect(user.food).to eql('cucumber')
  end

  it 'can stuff it' do
    Stuffer.factorize :user
    Stuffer.get_fields '/users/new'
    Stuffer.stuff
    click_on 'Create User'

    user = User.last
    expect(user.name).to eql('Stuff')
    expect(user.number).to eql(23)
    expect(user.stuffed).to be_true
    expect(user.food).to eql('cucumber')
  end



end