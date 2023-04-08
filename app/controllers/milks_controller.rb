class MilksController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # get all Milks
    def index
        milk = Milk.all
        render json: milk
    end

    # get one Milk
    def show
        milk = Milk.find_by(id: params[:id])
        if milk
          render json: milk
        else
          # If the id is not found 
          render json: { error: "Milk with id #{params[:id]} not found" }, status: :not_found
        end
    end

    # create new Milk
    def create
        milk = Milk.new(milk_params)
        if milk.save
          render json: milk.as_json(except: [:milk_image]), status: :created
        else
          render json: { error: milk.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
    end

    # update Milk
    def update
        milk = Milk.find(params[:id])
        milk.update!(milk_params)
        render json: milk, status: :accepted
    end

    # delete Milk
    def destroy
        milk = Milk.find(params[:id])
        if milk.destroy
            render json: {message: "Milk deleted"}
        else
            render json: {error: "Milk not deleted"}
        end
    end

    private

    def milk_params
        params.permit(:milk_kgs, :milk_date, :animal_id, :milk_image)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
