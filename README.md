# CleanAssociations

This is a gem to find or delete an invalid record in your activerecord object based on belongs_to association

## Installation

Add this line to your application's Gemfile:

    gem 'clean_associations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clean_associations

## Usage

This is a gem to find or delete an invalid record in your activerecord object. Lets say you have a Post model with user_id and some users are deleted 'Accidentally'. Even worse, you did not add a dependent destroy..(OMG..!).


Now when you display Post.all, you will get Record not found error.To avoid this, you may want to delete or find such records for which the associated record is missing. 'clean_associations' is for you. 


Once, you install the gem, you can do 

	Post.get_invalid_records_for(:user) 

This will return an array of invalid ids in your Post model for which associated User record is missing. 


You may want to delete them too.. ! So we have a method for that. 

	Post.destroy_invalid_records_for(:user) 


	
## Contributing

1. Fork it ( http://github.com/Manik-Ratnas/clean_associations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


#Todo

Specs

:collision: :collision: collision: 