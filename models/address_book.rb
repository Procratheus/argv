require_relative "entry.rb"
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry| 
      if name < entry.name
        break
      end
      index+=1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(entry)
    @entries.delete_at(entry)
  end

  def import_from_csv(file_name)
    csv_file = File.read(file_name)
    csv_import = CSV.parse(csv_file, headers: true)

    csv_import.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    return csv_import.count
    
  end

end