class Manage::ThingsController < Manage::BaseController
  before_filter :find_thing, only: [:edit, :update]

  def create
    @thing = Thing.create thing_params

    if @thing.errors.none?
      redirect_to root_path, flash: { success: 'Thing Created!' }
    else
      flash[:error] = @thing.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def index
    @things = Thing.newest_first.paginate(page: params[:page], per_page: 20).to_a
  end

  def new
    @thing = Thing.new
  end

  def update
    if @thing.update_attributes thing_params
      redirect_to manage_things_path, flash: { success: "#{@thing.name} was successfully updated." }
    else
      flash[:error] = @thing.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def find_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(
      :description,
      :image,
      :name,
      :tweet,
      :url
    )
  end
end
