class Person < Ohm::Model
  attribute :name
  attribute :age
  attribute :gender
  attribute :photo

  index :name

  def to_json
    {
      name: name,
      age: age,
      gender: gender,
      photo: photo
    }
  end
end