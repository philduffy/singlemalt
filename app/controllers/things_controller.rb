class ThingsController < ApplicationController
  def index
    @things = Thing.newest_first.paginate(page: params[:page]).to_a

    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
    @thing = Thing.find(params[:id])
  end
end
