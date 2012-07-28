class TimerosterLineController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /time_rosters
  # GET /time_rosters.json
  def index
     
    @test = TimeRoster.find(:all)
    @time_add = TimeRoster.new


    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_roster }
    end
  end

  # POST /time_rosters
  # POST /time_rosters.json
  def create
    @time_roster = TimeRoster.new(params[:time_roster])

    respond_to do |format|
      if @time_roster.save
        format.html { redirect_to @time_roster, notice: 'Time roster was successfully created.' }
        format.json { render json: @time_roster, status: :created, location: @time_roster }
      else
        format.html { render action: "new" }
        format.json { render json: @time_roster.errors, status: :unprocessable_entity }
      end
    end
  end
end