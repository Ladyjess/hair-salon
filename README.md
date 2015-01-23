##READ ME

Hair Salon Organizer.

You can use this organizer to maintain your hair salon more efficiently.


##AUTHORS

JESS



##INSTALL


This Hair Salon app is used in connection with the database POSTGRES.
After you have that installed, run psql in the terminal.


1. CREATE DATABASE hair_salon

2. CREATE TABLE stylists (id serial PRIMARY KEY, description varchar)

3. CREATE TABLE clients (id serial PRIMARY KEY, description varchar, stylist id int, appointment_date date)

4. CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon

(This is so that you may test the code in rspec)



## CODE

This app is written in Ruby.

Gems I used were Sinatra, Sinatra-contrib, and Pg.
You can ignore Pry and Rack. I use the older version of Rack to get to Sinatra's debugging page in browser. This browser debug page does not work for the newest version of rack. In general, you would check your terminal.

If you want to use old Rack, you have to run 'bundle exec ruby app.rb' in terminal once. From then forward you can run 'ruby app.rb'



##LICENSE

GNU GPL v2.0



##BUGS

No known bugs.

Report via pull request and/or comments.
