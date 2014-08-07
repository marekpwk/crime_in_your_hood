require 'csv'

def load_list(file)
  CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
    User.create(row.to_hash)
  end
end
load_list("db/salaries.csv")
