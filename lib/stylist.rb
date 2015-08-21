class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_stylist|
    self.name() == another_stylist.name() && self.id() == another_stylist.id()
  end

end
