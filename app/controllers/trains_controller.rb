class TrainsController < ApplicationController
  
  
  def index
    @trains = Train.all
  end
  
  def new
    @train = Train.new
  end
  
  def create
    @train = Train.new(params[:train])
    if @train.save
      flash[:notice] = "Train successfully created"
      redirect_to :action => 'index'
    else
      @errors = @train.errors
      render :action=>"new"
    end
  end
  
  def update
    
  end
  def show
    
  end
  
  # def show_my_account
    # raise params.inspect
  # end
end
