class CreaturesController < ApplicationController

    def index
        creatures = Creature.all
        render json:CreatureSerializer.new(creatures)
    end

    def create
        creature = Creature.new
        if creature.save
            render json: CreatureSerializer.new(creature)
        else
            render json: {errors: creature.errors.full_messages}
        end
    end

    def destroy
        creature = Creature.find(params[:id])
        creature.destroy
    end

    private

    def creature_params
        params.require(:creature).permot(:name, :image, :description)
    end

end
