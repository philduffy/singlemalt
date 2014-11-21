class Manage::ExperiencesController < Manage::BaseController
  before_filter :find_experience, only: [:edit, :update]

  def create
    @experience = Experience.create experience_params

    if @experience.errors.none?
      redirect_to root_path, flash: { success: 'Experience Created!' }
    else
      flash[:error] = @experience.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @experience.update_attributes(experience_params)
      redirect_to root_path, flash: { success: 'Successfully updated!' }
    else
      flash[:error] = @experience.errors.full_messages.join(', ')
      render :edit
    end
  end

  def new
    @experience = Experience.new
  end

  private

  def experience_params
    params.require(:experience).permit(
      :description,
      :ended_at,
      :job,
      :name,
      :started_at,
      :url
    )
  end

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
