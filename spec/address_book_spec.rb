require_relative "../models/address_book.rb"

RSpec.describe AddressBook do

  let(:book) { AddressBook.new } 

  def check_entry(entry, entry_name, entry_phone_number, entry_email)
    expect(entry.name).to eq(entry_name)
    expect(entry.phone_number).to eq(entry_phone_number)
    expect(entry.email).to eq(entry_email)
  end

  context "attributes" do
    it "should respond to entries" do

      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do 

      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do

      expect(book.entries.size).to eq(0)
    end
  end

  context ".add_entry" do
    it "should add an entry to an array" do
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")
      new_entry = book.entries[0]

      expect(new_entry.name).to eq("Alex")
      expect(new_entry.phone_number).to eq("012345")
      expect(new_entry.email).to eq("alex@yahoo.co.uk")
    end
  end

  context ".remove_entry" do
    it "should remove an entry from array" do 
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")
      entry = 0
      book.remove_entry(entry)

      expect(book.entries.size).to eq(0)
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq(5)
    end

    it "imports the first entry" do
      book.import_from_csv("entries.csv")
      first_entry = book.entries[0]
      check_entry(first_entry, "Alex", "012345", "alex@yahoo.co.uk")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv") 
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5555", "bob@blocmail.com")
    end
 
    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")    
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-5555", "joe@blocmail.com")
    end
 
    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-5555", "sally@blocmail.com")
    end
 
    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-5555", "sussie@blocmail.com")
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq(3)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "James", "111-111-111", "james@gmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]

      check_entry(entry_two, "Joe", "111-111-111", "joe@gmail.com")
    end    

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]

      check_entry(entry_three, "John", "111-111-111", "john@gmail.com")
    end
  end

end