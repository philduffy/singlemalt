class Manage::ExperiencesController < Manage::BaseController
  def create
    @experience = Experience.create experience_params

    if @experience.errors.none?
      redirect_to root_path, flash: { success: 'experience Created!' }
    else
      flash[:error] = @experience.errors.full_messages.join(', ')
      render :new
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
end
