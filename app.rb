require ('sinatra')
require ('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
require('pg')

also_reload('lib/**/*.rb')

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

# get('/stylist') do
#   @stylists = Stylist.all()
#   erb(:stylist)
# end

post('/new_stylist') do
  name = params.fetch('new_stylist')
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()

  redirect('/')
end
