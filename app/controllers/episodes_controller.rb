class EpisodesController < ApplicationController
	before_action :find_episode, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]
	before_action :authorize_owner, only: [:edit, :destroy]

	def index
		@episodes = Episode.order(created_at: :desc).page(params[:page]).per(params[:per] || 10)
	end

	def new
		@episode = Episode.new
	end

	def create
		@episode = Episode.new episode_params
		@episode.user = current_user
		if @episode.save
			flash[:notice] = "Episode created successfully"
			redirect_to episode_path(@episode)
		else
			flash[:alert] = "Episode not created"
			render :new
		end
	end

	def show
		@category = Category.find(@episode.category_id)
	end


	def edit
	end

	def update
		if @episode.update episode_params
			redirect_to episode_path(@episode), notice: "Episode updated"
		else
			render :edit
		end
	end

	def destroy
		@episode.destroy
		redirect_to episodes_path, notice: "Episode deleted"
	end



	private

	def episode_params
		params.require(:episode).permit(:title, :description, :link, :category_id, {tag_ids: []})
	end

	def find_episode
		@episode = Episode.find params[:id]
	end

	def authorize_owner
		redirect_to root_path, alert: "access denied" unless can? :manage, @episode
	end

end
