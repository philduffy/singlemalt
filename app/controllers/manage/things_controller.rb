class Manage::ThingsController < Manage::BaseController
  def create
    @thing = Thing.create thing_params

    if @thing.errors.none?
      redirect_to root_path, flash: { success: 'Thing Created!' }
    else
      flash[:error] = @thing.errors.full_messages.join(', ')
      render :new
    end
  end

  def new
    @thing = Thing.new
  end

  private

  def thing_params
    params.require(:thing).permit(
      :description,
      :image,
      :name,
      :url
    )
  end
end
