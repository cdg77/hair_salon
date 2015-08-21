require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('returns the name of the stylist') do
      test_stylist = Stylist.new(:name => 'Truvy Jones', :id => nil)
      expect(test_stylist.name()).to(eq('Truvy Jones'))
    end
  end

describe('#==') do
    it('overrides the equal comparator') do
      test_stylist1 = Stylist.new(:name => 'Truvy Jones', :id => 1)
      test_stylist2 = Stylist.new(:name => 'Truvy Jones', :id => 1)
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

describe('#save') do
  it('saves a stylist to the salon database') do
    test_stylist = Stylist.new({:name => 'Truvy Jones', :id => nil})
    test_stylist.save()
    expect(Stylist.all()).to(eq([test_stylist]))
  end
end

describe('.find') do
  it('finds a stylist by their id') do
    test_stylist1 = Stylist.new({:name => 'Truvy Jones', :id => nil})
    test_stylist1.save()
    test_stylist2 = Stylist.new({:name => 'Zohan Dvir', :id => nil})
    test_stylist2.save()
    expect(Stylist.find(test_stylist2.id().to_i)).to(eq(test_stylist2))
  end
end

describe('.all') do
  it('returns an empty array at first') do
    expect(Stylist.all()).to(eq([]))
  end
end


end
