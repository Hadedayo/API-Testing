describe "Testing the exchange rates" do

  before(:all) do
    @exchange_rates = ParseJson.new(HTTParty::get("http://data.fixer.io/api/latest?access_key=#{@api_key}").body))
  end

  it "should be a Hash" do
    expect(@exchange_rates.json_file).to be_kind_of (Hash)
  end

  it "should have base as EUR " do
    expect(@exchange_rates.get_base).to eq 'EUR'
  end

  it "should respond to the correct date " do
    expect(@exchange_rates.get_date).to eq "2017-07-26"
  end

  it "should have individual keys in the json_exchange as strings" do
    @exchange_rates.json_file.each do |key, value|
      expect(key).to be_kind_of(String)
    end
  end

  it "should have individual values in the rates as a Numeric" do
    @exchange_rates.json_file['rates'].values.each do |value|
      expect(value).to be_kind_of(Numeric)
    end
  end

  it "should have individual values in the rates as a Float" do
    @exchange_rates.json_file['rates'].values.each do |value|
      expect(value).to be_kind_of(Float)
    end
  end

  it "should have the number of characters to be 3 in each key for rates" do
    @exchange_rates.json_file['rates'].keys.each do |key|
      expect(key.length).to eq 3
    end
  end

  it "should return true if the values of rates are > zero" do
    @exchange_rates.json_file['rates'].values.each do |value|
      expect(value).to be > 0
    end
  end

  it "should return false if the values of rates are not > zero" do
    @exchange_rates.json_file['rates'].values.each do |value|
      expect(value).to be > 0
    end
  end








end
