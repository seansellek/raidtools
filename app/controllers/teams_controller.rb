class TeamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.where(user: current_user)
  end
  def new
    @team = Team.new
    @realms = Realm.all.includes(:region)
  end
  def create
    @team = Team.new(team_params)
    @team.user = current_user
    @team.save
    redirect_to teams_path
  end
  def edit
    @team = Team.find(params[:id])
    if @team && @team.user == current_user
      @realms = Realm.all.includes(:region)
    else
      redirect_to root
    end
  end
  def destroy
    @team = Team.find(params[:id])
    if @team.user = current_user
      @characters = @team.characters
      @characters.each {|character| character.destroy }
      @team.destroy
    end
      redirect_to teams_path
  end
  def update
    @team = Team.find(params[:id])
    if @team.user == current_user
      @team.update(team_params)
      redirect_to team_path(@team.id)
    else
      redirect_to root
    end
  end
  def show
    @team = Team.find(params[:id])
    if @team.user == current_user
      @characters = @team.characters
    else
      redirect_to root
    end
  end
  def refresh
    @team = Team.find(params[:id])
    @team.characters.map(&:refresh_item_data!)
    redirect_to team_path(@team)
  end

  private
  def team_params
    params.require(:team).permit(:name, characters_attributes: [:id, :name, :realm_id, :_destroy])
  end
end
