require ('sinatra')
require ('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
require('pg')

also_reload('lib/**/*.rb')

# DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end
