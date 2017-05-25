class Rate < ApplicationRecord
	  validates :value_currency, numericality: true

	  before_save :get_values

	  def get_values
	    url = "http://api.nbp.pl/api/exchangerates/rates/a/#{currency.downcase}/#{date}/?format=json"
	    response = HTTParty.get(url)
	    data = JSON.parse(response.body)
	    self.table = data['rates'][0]['no']	    
	    self.table_date = data['rates'][0]['effectiveDate']	    
	    self.converter = data['rates'][0]['mid']
	    value_pln = value_currency * converter
	    self.value_pln = value_pln.round(2)
  	  end
end
