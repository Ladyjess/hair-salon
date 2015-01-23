class Client

  attr_reader(:description,:stylist_id, :appointment_date)

  define_method(:initialize) do |attributes|
  @description = attributes[:description]
  @stylist_id = attributes[:stylist_id]
  @appointment_date = attributes[:appointment_date]
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
    description = client.fetch("description")
    stylist_id = client.fetch("stylist_id").to_i()
    appointment_date = client.fetch("appointment_date")
    clients.push(Client.new({:description => description, :stylist_id => stylist_id, :appointment_date => appointment_date}))
    end
  clients
  end

  define_method(:save) do
   DB.exec("INSERT INTO clients (description, stylist_id, appointment_date) VALUES ('#{@description}', #{@stylist_id}, '#{@appointment_date}')")
   end

  define_method(:==) do |another_client|  self.description().==(another_client.description()).&(self.stylist_id().==(another_client.stylist_id())).&(self.appointment_date().==(another_client.appointment_date()))
  end
end
