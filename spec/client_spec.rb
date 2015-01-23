require('spec_helper')


  describe(Client) do

  describe(".all") do
  it("is empty at first") do
   expect(Client.all()).to(eq([]))
    end
  end

  describe("#description") do
  it("provides name and description of service") do
   test_client = Client.new({:description => "Mary - Hair color", :stylist_id => 1, :appointment_date => "2015-01-30 11:00:00"})
    expect(test_client.description()).to(eq("Mary - Hair color"))
    end
  end

  describe("#==") do
  it("is the same client if it has the same description") do
   client1 = Client.new({:description => "Mary - Hair color", :stylist_id => 1, :appointment_date => "2015-01-30 10:00:00"})
   client2 = Client.new({:description => "Mary - Hair color", :stylist_id => 1, :appointment_date => "2015-01-30 10:00:00"})
    expect(client1).to(eq(client2))
    end
  end

  describe("#save") do
  it("adds a client to the array of saved clients") do
   test_client = Client.new({:description => "Mary - Hair color", :stylist_id => 1, :appointment_date => "2015-01-25 09:00:00"})
   test_client.save()
    expect(Client.all()).to(eq([test_client]))
    end
  end
end
