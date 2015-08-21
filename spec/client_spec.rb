require('spec_helper')

describe(Client) do
  describe('#name') do
    it("returns the name of the client") do
    test_client = Client.new(:name => 'George Roundy', :id => nil, :stylist_id => 1)
    expect(test_client.name()).to(eq('George Roundy'))
    end
  end

  describe('.all') do
    it('returns an empty array at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('overrides the equal comparator') do
      test_client1 = Client.new(:name => 'George Roundy', :id => 1, :stylist_id => 1)
      test_client2 = Client.new(:name => 'George Roundy', :id => 1, :stylist_id => 1)
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('#save') do
    it('allow a client to be saved in list') do
      test_client = Client.new({:name => 'George Roundy', :id => nil, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#update') do
    it('allow user to update a clients information') do
      test_client = Client.new({:name => 'Edwrard', :id => nil, :stylist_id => 1})
      test_client.save()
      test_client.update({:name => 'Mr ScisscorHands', :id => nil, :stylist_id => 1})
      expect(test_client.name()).to(eq('Mr ScisscorHands'))
    end
  end

  describe('#delete') do
    it('allows user to delete a clients') do
      test_client1 = Client.new({:name => 'George Roundy', :id => nil, :stylist_id => 1})
      test_client1.save()
      test_client2 = Client.new({:name => 'Kim Boggs', :id => nil, :stylist_id => 1})
      test_client2.save()
      test_client1.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end

  describe('.find') do
    it('return a client by their id') do
      test_client1 = Client.new({:name => 'George Roundy', :id => nil, :stylist_id => 1})
      test_client2 = Client.new({:name => 'Kim Boggs', :id => nil, :stylist_id => 1})
      test_client1.save()
      test_client2.save()
      expect(Client.find(test_client1.id().to_i)).to(eq(test_client1))
    end
  end
end
