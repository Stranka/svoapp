rails generate migration add_fieldorder_to_menues fieldorder:integer

rake db:fixtures:load

rake db:fixtures:load FIXTURES=users,stores