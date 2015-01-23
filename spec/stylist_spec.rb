require('spec_helper')


 describe("#Stylist") do

  describe(".all") do
    it("starts off with no lists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("tells you the stylist") do
     stylist = Stylist.new({:description => "Amber", :id => nil})
     expect(stylist.description()).to(eq("Amber"))
    end
  end

  describe("#id") do
    it("sets the ID when you save it") do
     stylist = Stylist.new({:description => "Amber", :id => nil})
     stylist.save()
     expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
     test_stylist = Stylist.new({:description => "Amber", :id => nil})
     test_stylist.save()
     test_stylist2 = Stylist.new({:description => "Samantha", :id => nil})
     test_stylist2.save()
     expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
     stylist = Stylist.new({:description => "Casey", :id => nil})
     stylist.save()
     expect(Stylist.all()).to(eq([stylist]))
    end
  end

 describe("#==") do
    it("is the same if it has the same description") do
     stylist1 = Stylist.new({:description => "Giovanna", :id => nil})
     stylist2 = Stylist.new({:description => "Giovanna", :id => nil})
     expect(stylist1).to(eq(stylist2))
    end
  end

 describe("#clients") do
   it("returns an array of clients for the stylist") do
    test_stylist = Stylist.new({:description => "Jasmine", :id => nil})
    test_stylist.save()
    test_client = Client.new({:description => "Mary - Hair dye", :stylist_id => test_stylist.id(), :appointment_date => "2015-02-10 14:00:00"})
    test_client.save()
    test_client2 = Client.new({:description => "John - Hair cut", :stylist_id => test_stylist.id(), :appointment_date => "2015-05-10 16:00:00"})
    test_client2.save()
    expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
