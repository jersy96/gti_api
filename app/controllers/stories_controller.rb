class StoriesController < ApplicationController
  before_action :destroy_expired_stories, only: :index

  def index
    stories = Story.all
    render json: stories, status: :ok
  end

  def create
    story = Story.new(story_params)
    story.user_id = @current_user.id
    if story.save
      render json: story, status: :ok
    else
      render json: story.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def story_params
    params.permit(
      :file_type,
      :file
    )
  end

  def destroy_expired_stories
    Story.where('? >= expiration_time', Time.now).destroy_all
  end
end
