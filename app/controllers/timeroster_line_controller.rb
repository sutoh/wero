class TimerosterLineController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /time_rosters
  # GET /time_rosters.json
  def index
     
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    
    
    @user = current_user
    @time_roster = TimeRoster.find_by_sql("SELECT 'time_rosters'.* FROM 'time_rosters' WHERE 'time_rosters'.'id' IN (SELECT 'timeroster_lines'.time_roster_id FROM 'timeroster_lines' WHERE 'timeroster_lines'.'user_id' = '" + @user.id.to_s + "')")
    # @time_roster = TimeRoster.where(:work_date => @year.to_s + "-" + @month.to_s + "-" + "*")  
    @time_add = TimeRoster.new



    @shown_month = Date.new(@year, @month)
    @month_name_text = @shown_month.strftime("%Y-%m")
    @previous_month_text = "<<" + @shown_month.prev_month.strftime("%Y-%m")
    @next_month_text = @shown_month.next_month.strftime("%Y-%m") + ">>"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_roster }
    end
  end

  # POST /time_rosters
  # POST /time_rosters.json
  def create
    @time_roster = TimeRoster.new(params[:time_roster])
    @timeroster_line = TimerosterLine.create
    @timeroster_line.timeroster = @time_roster
    @timeroster_line.user = current_user
    if @timeroster_line.save
      redirect_to :index
    else
      redirect_to :index      
    end
  end
end