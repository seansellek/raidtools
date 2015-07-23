class TeamsController < ApplicationController
  before_action :find_realm, only: [:create, :update]
  def index
    @teams = Team.all
  end
  def new
    @team = Team.new
  end
  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to teams_path
  end
  def edit
    @team = Team.find(params[:id])
    @realms = Realm.all.includes(:region)
  end
  def destroy
    @team = Team.find(params[:id])
    @characters = @team.characters
    @characters.each {|character| character.destroy }
    @team.destroy
    redirect_to teams_path
  end
  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to teams_path
  end
  def show
    @team = Team.find(params[:id])
    @characters = @team.characters
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
  def find_realm
    #in params, find each character, and convert realm field (id) to realm object
  end
end
