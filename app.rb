require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")



DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  description = params.fetch("description")
  stylist_id = params.fetch("stylist_id").to_i()
  appointment_date = params.fetch("appointment_date")
  client = Client.new({:description => description, :stylist_id => stylist_id, :appointment_date => appointment_date})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
  end

post("/stylists") do
  description = params.fetch("description")
  stylist = Stylist.new({:description => description, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end
