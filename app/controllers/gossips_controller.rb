class GossipsController < ApplicationController

	def index
		@gossips = Gossip.all
	end

	def new
		@gossip = Gossip.new

	end

	def create
		@gossip = Gossip.new(gossip_params)
		#@gossip = Gossip.new(params[:gossip])
		#@gossip.anonymous_author = params[:anonymous_author]
		#@gossip.content = params[:content]
		if @gossip.save
		redirect_to @gossip
		else
		  render 'new'
		end
	end

	def show
		@gossip = Gossip.find(params[:id])

	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		if @gossip.update(gossip_params)
			redirect_to gossips_path
		else
			render 'edit'
		end

	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end


	private 

	def gossip_params
		params.require(:gossip).permit(:anonymous_author, :content)
	end
end
