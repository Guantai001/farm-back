class MilksController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # get all Milks
    def index
        milk = Milk.all
        render json: milk, include: [:animal]
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
        if !Milk.find_by(milk_date: params[:milk_date], animal_id: params[:animal_id])
            milk = Milk.new(milk_params)
            if milk.save
                render json: milk.as_json(except: [:milk_image]), status: :created
            else
                render json: { error: milk.errors.full_messages.join(', ') }, status: :unprocessable_entity
            end
        else
            render json: { error: "You Can't Add Milk Twice Same Day" }, status: :unprocessable_entity
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

    # get milk_kgs for a specific milk record
    def milk_kgs
        milk = Milk.find(params[:id])
        if milk
            render json: { message: "Milk with id #{params[:id]} has #{milk.milk_kgs} kgs of milk" }
        else
            render json: {error: "Milk with id #{params[:id]} not found"}, status: :not_found
        end
    end

    #  Total milk from all 
    def total_milk_kgs
       totals = {}
       Milk.all.each do |milk|
          animal_id = milk.animal_id
        if totals[animal_id]
            totals[animal_id] += milk.milk_kgs
        else
            totals[animal_id] = milk.milk_kgs
          end
       end
    return totals.values.sum
    end

    def total
        totals = total_milk_kgs
        render json: { message: "Total milk_kgs for all animals: #{totals}" }
    end

    # TOTAL MILK FOR EACH ANIMAL ID
    def total_milk_kgs_animal
        totals = {}
        Milk.all.each do |milk|
            animal_id = milk.animal_id
            if totals[animal_id]
                totals[animal_id] += milk.milk_kgs
            else
                totals[animal_id] = milk.milk_kgs
            end
        end
        return totals
    end

    def total_animal
        # find the animal_id
        animal_id = params[:id]
        # get the total milk kgs for a specific animal_id
        totals = total_milk_kgs_animal
        # find the total milk kgs for a specific animal_id
        total = totals[animal_id.to_i]
        # render the total milk kgs for a specific animal_id
        render json: { message: "Total milk_kgs for animal with id #{animal_id}: #{total}" }    
    end


    private

    def milk_params
        params.permit(:milk_kgs, :milk_date, :animal_id, :milk_image)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
