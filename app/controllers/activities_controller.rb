class ActivitiesController < ApplicationController
  load_and_authorize_resource

  # GET /activities or /activities.json
  def index
    redirect_to categories_path
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.author = current_user

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity.categories.first, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:name, :amount, category_ids: [])
  end
end
