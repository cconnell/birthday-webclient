class Birthday

  attr_reader :id
  attr_accessor :first_name, :last_name, :gift

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @gift = hash["gift"]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def destroy
    Unirest.delete()
  end
  
  def self.find(id)
    Birthday.new(Unirest.get("http://localhost:3000/birthdays/#{id}").body)
  end

  def self.all
    api_birthdays_array = Unirest.get("http://localhost:3000/birthdays").body
    birthdays = []
    api_birthdays_array.each { |api_birthday| birthdays << Birthday.new(api_birthday)}
    birthdays
  end


end

