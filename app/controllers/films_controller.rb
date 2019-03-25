class SwApi
	include HTTParty

	def films
		self.class.get('https://swapi.co/api/films')
	end

	def people
		self.class.get('swapi.co/api/people')
	end

	def planets
		self.class.get('swapi.co/api/planets')
	end

	def starships	
		self.class.get('swapi.co/api/starships')
	end

	def people_by_link(link)
		self.class.get(link)
	end

end

class FilmsController < ApplicationController
	def index
		swap = SwApi.new
		@films = swap.films();
	end

	def show
		swap = SwApi.new
		@film = swap.people_by_link(params[:pelicula])
		@characters = Array.new
		@film['characters'].each do |char|
			@characters.insert(-1,swap.people_by_link(char))
		end
		@planetas = Array.new
		@film['planets'].each do |planet|
			@planetas.insert(-1, swap.people_by_link(planet))
		end

		@naves = Array.new
		@film['starships'].each do |nave|
			@naves.insert(-1, swap.people_by_link(nave))
		end

	end

	def personaje
		swap = SwApi.new
		@personaje = swap.people_by_link(params[:url])
		@films = Array.new

		@planet = swap.people_by_link(@personaje["homeworld"])

		@personaje['films'].each do |film|
			@films.insert(-1, swap.people_by_link(film))
		end

		@naves = Array.new
		@personaje['starships'].each do |nave|
			@naves.insert(-1, swap.people_by_link(nave))
		end
	end

	def planeta
		swap = SwApi.new
		@planeta = swap.people_by_link(params[:url])
		
		@characters = Array.new
		@planeta['residents'].each do |char|
			@characters.insert(-1,swap.people_by_link(char))
		end

		@films = Array.new
		@planeta['films'].each do |film|
			@films.insert(-1, swap.people_by_link(film))
		end

	end

	def nave
		swap =  SwApi.new
		@nave = swap.people_by_link(params[:url])

		@characters = Array.new
		@nave['pilots'].each do |char|
			@characters.insert(-1,swap.people_by_link(char))
		end
		@films = Array.new
		@nave['films'].each do |film|
			@films.insert(-1, swap.people_by_link(film))
		end

	end

end

