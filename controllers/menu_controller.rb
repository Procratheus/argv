
require_relative "../models/address_book.rb"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main menu - #{@address_book.entries.count} entries"
    puts "1 - View All entries"
    puts "2 - View entry number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      select_entry
      main_menu
    when 3
      system "clear"
      create_entry
      main_menu
    when 4
      system "clear"
      search_entries
      main_menu
    when 5
      system "clear"
      read_csv
      main_menu
    when 6
      puts "Good-bye!"

      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
      
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"

  end

  def select_entry
    system "clear"
    print "select entry number: "
    selection = gets.chomp.to_i
    if @address_book.entries.fetch(selection, nil) != nil
      puts @address_book.entries.fetch(selection).to_s
      system "clear"
      main_menu
    else
      puts "No entry matching that number"
      system "clear"
      main_menu
    end
  end

  def create_entry
    system "clear"
    puts "NewAddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "new entry created"
  end

  def search_entries
    print "Enter a name: "
    name = gets.chomp

    match = @address_book.binary_search(name)
    system "clear"

    if match 
      puts match.to_s
      search_submenu(match)
    else
      puts "No record was found for #{name}"
    end
  end

  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when d
      system "clear"
      delete_entry(entry)
      main_menu
    when e
      edit_entry(entry)
      system "clear"
      main_menu
    when m 
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end

  def read_csv
    print "Enter a file name to import: "
    file_name = gets.chomp

    if file_name.empty?
      system "clear"
      puts "No file name to read"
      main_menu
    end

    begin
      @address_book.import_from_csv(file_name)
      puts "Your imported #{@address_book.count} entries from #{file_name}"
    rescue
      puts "#{file_name} is not a vaild file. Please try again."
      read_csv
    end
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entry_submenu(entry)
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end

  end

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted."
  end

  def edit_entry(entry)
    print "Update name: "
    name = gets.chomp
    print "Update number: "
    number = gets.chomp
    print "Update email: "
    email = gets.chomp

    entry.name = name if !name.empty?
    entry.number = number if !number.empty?
    entry.email = email if !email.empty?

    system "clear"
    puts "Updated entry."
    puts entry
  end

end