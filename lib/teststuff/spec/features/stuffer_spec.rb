require 'spec_helper'


describe 'stuffing' do

  # it 'works' do
  #   visit '/users/new'
  #   save_and_open_page
  # end

  it 'gets input fields' do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.fill :name
    Stuffer.fill :email
    click_on 'Create User'

    user = User.last
    expect(user.name).to eql('Stuff')
    expect(user.email).to eql('Me')
  end

  it 'gets select boxes' do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.select :number
    click_on 'Create User'

    user = User.last
    expect(user.number).to eql(23)
  end

  it 'can check a box' do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.check :stuffed
    click_on 'Create User'

    user = User.last
    expect(user.stuffed).to be_true
  end

  it 'can select a radio button' do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.radio :food
    click_on 'Create User'

    user = User.last
    expect(user.food).to eql('cucumber')
  end

  it 'can stuff it' do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.stuff
    click_on 'Create User'

    user = User.last
    expect(user.name).to eql('Stuff')
    expect(user.number).to eql(23)
    expect(user.stuffed).to be_true
    expect(user.food).to eql('cucumber')
  end

  it 'can handle 2 factories' do
    visit new_user_path
    Stuffer.factorize :user, :info
    Stuffer.stuff
    click_on 'Create User'

    user = User.last
    expect(user.name).to eql('Stuff')
    expect(user.number).to eql(23)
    expect(user.stuffed).to be_true
    expect(user.food).to eql('cucumber')

    info = Info.last
    expect(info.wage).to eql(1)
  end

  it 'can fill in a nested form' do
    visit new_user_path
    Stuffer.factorize :user, :info
    Stuffer.fill :wage
    click_on 'Create User'

    info = Info.last
    expect(info.wage).to eql(1)
  end

  it "doesn't fill in a field if you pass it as an argument to stuff" do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.stuff :email
    click_on 'Create User'

    user = User.last
    expect(user.email).to eql("")
  end

  it "doesn't fill in multiple fields if you pass in multiple arguments" do
    visit new_user_path
    Stuffer.factorize :user
    Stuffer.stuff :email, :food
    click_on 'Create User'

    user = User.last
    expect(user.email).to eql("")
    expect(user.food).to eql(nil)
  end



end