class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    activities = Activity.all
    render json: activities
  end

  def show 
    activity = Activity.find_by(params[:id])
    render json: activity
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
  end
  
  private 

  def render_not_found_response
    render json: { error: "Activity not found" }, status: :not_found
  end
end
