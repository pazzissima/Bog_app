 # We need to create a controller
 # CreaturesController for creatures
 
 class CreaturesController < ApplicationController

 	def index
 		@creatures = Creature.all
 		render :index
 	end

 	def new
        render :new
    end



    def create
		creature = params.require(:creature).permit(:name, :description)
	    #require(:creature) = grabbing the value of the key
	    new_creature = Creature.create(creature)
	    redirect_to "/creatures/#{new_creature.id}"
    end

    def show 
        id = params[:id]
        @creature = Creature.find(id)
        render :show
    end

    def edit
    	id = params[:id]
    	@creature = Creature.find(id)
    	render :edit

    end

    def update
        id = params[:id]
        creature = Creature.find(id)        
        updated_info = params.require(:creature).permit(:name, :description)
        creature.update_attributes(updated_info)
        redirect_to "/creatures/#{creature.id}"
    end

 end