describe "Testing the exchange rates" do

  before(:all) do
    @api_key = ENV['FIXER_API_KEY']
    @file = ParseJson.new(HTTParty::get("http://data.fixer.io/api/latest?access_key=#{@api_key}").body)
  end

  it "should be a Hash" do
    expect(@file.json_file).to be_kind_of (Hash)
  end

  it "should have base as EUR " do
    expect(@file.get_base).to eq 'EUR'
  end

  it "should respond to the correct date " do
    expect(@file.get_date).to eq "2018-11-26"
  end

  it "should have individual keys in the json_exchange as strings" do
    @file.json_file.each do |key, value|
      expect(key).to be_kind_of(String)
    end
  end

  it "should have individual values in the rates as a Numeric" do
    @file.json_file['rates'].values.each do |value|
      expect(value).to be_kind_of(Numeric)
    end
  end

  it "should have the number of characters to be 3 in each key for rates" do
    @file.json_file['rates'].keys.each do |key|
      expect(key.length).to eq 3
    end
  end

  it "should return true if the values of rates are > zero" do
    @file.json_file['rates'].values.each do |value|
      expect(value).to be > 0
    end
  end

  it "should return false if the values of rates are not > zero" do
    @file.json_file['rates'].values.each do |value|
      expect(value).to be > 0
    end
  end








end
