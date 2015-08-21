require('spec_helper')

describe(Stylist) do
  describe('#stylist_name') do
    it('returns the name of the stylist') do
      test_stylist = Stylist.new(:stylist_name => 'Truvy Jones', :id => nil)
      expect(test_stylist.stylist_name()).to(eq('Truvy Jones'))
    end
  end
end
