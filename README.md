# USINE PROJECT ON RAILS

Rennes City

Version de ruby utilisée - ruby '2.5.1'


How to install and test?

Download or clone the repository
$ git clone https://github.com/RomainSai/Usine-Project-Rails  
Run the command bundle install to install the necessary gems
$ bundle install

Update your database structure with the migration command.The database in not uploaded to github, so it is necessary tu run the differents migrations:
$ rails db:migrate
Add data into your database with the seed file:
$ rails db:seed

Database structure:

2 models:

* assembly
* part

1 table "join":

AssemblyPart


Enjoy :)
