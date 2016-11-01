class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_id = @movie.id
    @movie_title = @movie.title
    @movie_year = @movie.year
    @movie_duration = @movie.duration
    @movie_description = @movie.description
    @movie_image_url = @movie.image_url
    @movie_director_id = @movie.director_id
  end

  def new_form
  end

  def create_row
    movie = Movie.new
    movie.title = params[:the_title]
    movie.year = params[:the_year]
    movie.duration = params[:the_duration]
    movie.description = params[:the_description]
    movie.image_url = params[:the_image_url]
    movie.director_id = params[:director_id]

    movie.save

    redirect_to("/movies/#{movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    movie = Movie.find(params[:id])
    movie.title = params[:title]
    movie.year = params[:year]
    movie.duration = params[:duration]
    movie.description = params[:description]
    movie.image_url = params[:image_url]
    movie.director_id = params[:director_id]
    movie.save
    redirect_to("/movies/#{movie.id}")
  end

  def destroy
    movie = Movie.find_by({ :id => params[:id] })
    @movie_title = movie.title
    movie.destroy
  end
end
