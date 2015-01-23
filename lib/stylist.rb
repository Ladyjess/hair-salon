class Stylist
  attr_reader(:description, :id)

 define_method(:initialize) do |attributes|
   @description = attributes[:description]
   @id = attributes[:id]
  end


 define_singleton_method(:all) do
  returned_stylists = DB.exec("SELECT * FROM stylists;")
   stylists = []
   returned_stylists.each() do |stylist|
   description = stylist.fetch("description")
   id = stylist.fetch("id").to_i()
   stylists.push(Stylist.new({:description => description, :id => id,}))
     end
   stylists
  end

 define_singleton_method(:find) do |id|
   found_stylist = nil
   Stylist.all().each() do |stylist|
    if stylist.id().==(id)
      found_stylist = stylist
      end
    end
   found_stylist
  end

 define_method(:save) do
  result = DB.exec("INSERT INTO stylists (description) VALUES ('#{@description}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
  end

 define_method(:==) do |another_stylist|
  self.description().==(another_stylist.description()).&(self.id().==(another_stylist.id()))
  end


 define_method(:clients) do
  clients_stylists = []
  clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
    description = client.fetch("description")
    stylist_id = client.fetch("stylist_id").to_i()
    appointment_date = client.fetch("appointment_date")
    clients_stylists.push(Client.new({:description => description, :stylist_id => stylist_id, :appointment_date => appointment_date}))
      end
    clients_stylists
  end
end
