class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.newest_first.to_a
  end
end
