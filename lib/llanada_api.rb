require 'rubygems'
require 'httparty'

class SwApi
	include HTTParty
	base_uri "swapi.co/api"

	def films
		self.class.get('/films')
	end

	def people
		self.class.get('/people')
	end

	def planets
		self.class.get('/planets')
	end

	def starships	
		self.class.get('/starships')
	end

	def people_by_id(id)
		self.class.get('/people/'+id)
	end

end

class SwApi_2
	include HTTParty
	def buscar(link)
		self.class.get(link)
	end
end
swapi_resty = SwApi_2.new

puts swapi_resty.buscar("https://swapi.co/api/people/7/")

