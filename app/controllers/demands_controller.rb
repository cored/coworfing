class DemandsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    @demands = Demand.all 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

  def create
    @demand = Demand.new(params[:demand])

    respond_to do |format|
      if @demand.save
        format.html { redirect_to root_url, notice: 'Invitation Request was successfully sent.' }
      else
        format.html { render action: "new" }
      end
    end
  end


end