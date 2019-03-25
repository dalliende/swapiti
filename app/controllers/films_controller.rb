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
		@film = params[:pelicula]
		@characters = Array.new
		@film['characters'].each do |char|
			@characters.insert(-1,swap.people_by_link(char))
		end


	end

	def personaje
		@personaje = params[:personaje]
	end

end

