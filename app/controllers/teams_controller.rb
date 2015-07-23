class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  def create

  end


  private
  def team_params
    params.require(:team).permit(:title)
  end
end
