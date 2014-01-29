class ThingsController < ApplicationController
  def index
    @things = Thing.newest_first.paginate(page: params[:page]).to_a
  end
end
