class DairySellsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # get all DairySells
    def index
        dairy_sell = DairySell.all
        render json: dairy_sell, include: [:animal]
    end

    # get one DairySell
    def show
        dairy_sell = DairySell.find_by(id: params[:id])
        if dairy_sell
          render json: dairy_sell
        else
          # If the id is not found 
          render json: { error: "DairySell with id #{params[:id]} not found" }, status: :not_found
        end
    end

    # create new DairySell

    def create
        dairy_sell = DairySell.new(dairy_sell_params)
        if dairy_sell.save
            render json: dairy_sell.as_json(except: [:dairy_sell_image]), status: :created
        else
            render json: { error: dairy_sell.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
    end

    # update DairySell
    def update
        dairy_sell = DairySell.find(params[:id])
        dairy_sell.update!(dairy_sell_params)
        render json: dairy_sell, status: :accepted
    end

    # delete DairySell
    def destroy
        dairy_sell = DairySell.find(params[:id])
        if dairy_sell.destroy
            render json: {message: "DairySell deleted"}
        else
            render json: {error: "DairySell not deleted"}
        end
    end

    # get dairy_sell_kgs for a specific dairy_sell record
    def dairy_sell_kgs
        dairy_sell = DairySell.find(params[:id])
        if dairy_sell
            render json: { message: "DairySell with id #{params[:id]} has #{dairy_sell.dairy_sell_kgs} kgs of dairy_sell" }
        else
            render json: {error: "DairySell with id #{params[:id]} not found"}, status: :not_found
        end
    end

    private

    def dairy_sell_params
        params.permit(:sold_item , :sold_price, :sold_date)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable`
end
