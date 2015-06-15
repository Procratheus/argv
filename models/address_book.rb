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

  def binary_search(name)
    lower = 0
    upper = @entries.length - 1

    while lower <= upper
      mid = (upper + lower) / 2
      mid_name = @entries[mid].name

      if name == mid_name
        return @entries[mid]
      elsif name < mid_name 
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end
    return nil
  end

  def iterative_search(name)
    start = 0
    finish = @entries.length - 1

    while start <= finish
      pos = start
      position_name = @entries[pos].name

      if name == position_name
        return @entries[pos]
      else
        start = pos + 1
      end
    end
    return nil
  end

end