RSpec.describe AddressBook do

  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new

      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do 
      book = AddressBook.new

      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new

      expect(book.entries.size).to eq(0)
    end
  end

  context "add_entry" do
    it "should add an entry to an array" do
      book = AddressBook.new
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")

      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")
      new_entry = book.entries[0]

      expect(new_entry.name).to eq("Alex")
      expect(new_entry.phone_number).to eq("012345")
      expect(new_entry.email).to eq("alex@yahoo.co.uk")
    end
  end

  context "remove_entry" do
    it "should remove an entry from array" do 
      book = AddressBook.new
      book.add_entry("Alex", "012345", "alex@yahoo.co.uk")
      entry = 0
      book.remove_entry(entry)

      expect(book.entries.size).to eq(0)
    end
  end

end