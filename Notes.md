# Things I had to do to get the cloned challenge.electionbuddy.com project working

* notice a `Rakefile`
* run `rake` and get an error about the installed ruby version being too new.
* install `rvm`, which required a reboot
* run `rvm install "ruby-2.6.1"`
* run `rvm use 2.6.1`
* run `rake` and get an error about bundler being out of date.
* After some research, decide to run `gem install bundler`
* run `rake` and get an error that prompted me to run `bundle install`
* run `rake` and get an error about no JS engine being available
* install nodejs
* run `rake`, and note that the tests pass :+1:
* run `rails s` and get a page at localhost:3000 with an error about pending migrations
* push the "run pending migrations" button

# Rough plan

* Think about what should go in the `audit_events` table
    * Well we just need to store the data to be able to display what happened.
        * something like `user` U changed `column` C on `table` T from `value` V_old to `value` V_new in `election` E
    * so `ID, user_id, election_id, column_name, table_name, old_value, new_value, created_at, updated_at`?
* Make a separate audit page
* Make an `audit_events` table
* Make an index on election id for the `audit_events` table
* display the entries from the `audit_events` table on the audit page

# Future Ideas
* Can we find a reasonable way to avoid having to give the table name explicitly?
* If we add more fields than visibilty to the elections settings in the future, we may want to serialize the hash in a better way.
    * JSON?
    * Maybe add a `value_type` column that would indicate the type of the `new_value` column, so we know how to deserialize it.
* Nicer UI in general
    * Map user id to name and display just the name.
    * Add links to the items that were logged?
    * Do we want to filter out the creation events? Or maybe we can say something like "User U created a new blah"?
