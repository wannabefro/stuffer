# Stuffer

Combines factory_girl and capybara to automatically populate forms
with factory_girl information<br>
**Pull requests welcome. Make sure to submit a successful test**<br>
**Submit a failing test with any bugs/issues**

## Installation

Add this line to your application's Gemfile:

    gem 'stuffer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stuffer

## Usage

visit the page you want to fill with capybara i.e.
    
    visit new_user_path
    
load your factory into stuffer

    Stuffer.factorize :factory_name
    
to automatically fill in all fields on the page

    Stuffer.stuff
    
you can tell stuffer to not fill in certain fields on a stuff by passing the factory_field
as an argument to stuff i.e.

    Stuffer.stuff :factory_field
    
to fill in individual fields, stuffer currently supports input_fields, selections,
checkboxes and radio buttons

    Stuffer.fill :factory_field
    Stuffer.select :factory_field
    Stuffer.check :factory_field
    Stuffer.radio :factory_field
    
don't forget to submit the form with capybara after Stuffer
    
    click_on 'Create user'
    
You can also use nested forms with stuffer.
First factorize both the form and the nested form

    Stuffer.factorize :factory_name, :nested_factory_name
    
It's important that the nested factory is supplied as the second argument
You can then use stuffer just as you would with a single model

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit
[capybara](https://github.com/jnicklas/capybara)<br>
[FactoryGirl](https://github.com/thoughtbot/factory_girl)<br>
[HeroicEric](https://github.com/HeroicEric)<br>
[MattThousand](https://github.com/mattThousand)<br>
