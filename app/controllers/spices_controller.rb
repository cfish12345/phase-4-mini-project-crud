class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    def show
        spice = Spice.find_by(id: params[:id])
        render json: spice, status: :found
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            render json: {error: "Couldn't find spice"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            render json: {}
        else
            render json: {error: "Couldn't find spice"}, status: :not_found
        end
    end

    private

    def spice_params
       params.permit(:title, :image, :description, :notes, :rating) 
    end
end
