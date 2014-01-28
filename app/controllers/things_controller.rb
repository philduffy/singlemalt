class ThingsController < ApplicationController
  def index
    @things = Thing.newest_first.to_a
  end
end
