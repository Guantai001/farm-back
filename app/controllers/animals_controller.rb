class AnimalsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # get all Animals
    def index
        animal = Animal.all
        render json: animal
    end

    # get one Animal
    def show
        animal = Animal.find_by(id: params[:id])
        if animal
          render json: animal
        else
          # If the id is not found 
          render json: { error: "Animal with id #{params[:id]} not found" }, status: :not_found
        end
      end

    # create new Animal
    def create
        animal = Animal.new(animal_params)
        if animal.save
          render json: animal.as_json(except: [:animal_image]), status: :created
        else
          render json: { error: animal.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end

    # update Animal
    def update
        animal = Animal.find(params[:id])
        animal.update!(animal_params)
        render json: animal, status: :accepted
        end

    # delete Animal
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: {message: "Animal deleted"}
        else
            render json: {error: "Animal not deleted"}
        end
    end

    private

    def animal_params
        params.permit(:animal_name, :animal_type, :animal_health, :animal_age, :animal_image)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
    
end
