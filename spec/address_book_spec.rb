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





end