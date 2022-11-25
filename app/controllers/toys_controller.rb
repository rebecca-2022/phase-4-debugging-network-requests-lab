  class ToysController < ApplicationController
    wrap_parameters format: []
  
    def index
      toys = Toy.all
      render json: toys, status: :ok
    end
  
    def create
      #create a new object, should be called on model name 
      toy = Toy.create(toy_params)
      render json: toy, status: :created
    end
  
    def update
      toy = Toy.find_by(id: params[:id])
      toy.update(toy_params)
      render json: toy, status: :ok
    end
  
    def destroy
      toy = Toy.find_by(id: params[:id])
      toy.destroy
      head :no_content
    end
  
    #update the toy by increment_likes
    def increment_likes
      #find the toy by id and update
      toy = Toy.find_by(id: params[:id])
      if toy
        toy.update(likes: toy.likes + 1)
        render json: toy
      else
        render json: { error: "Toy not found" }, status: :not_found
      end
    end
  
    private
    def toy_params
      params.permit(:name, :image, :likes)
    end
  
  end