class PositionController < ApplicationController

  def index
    @positions = Position.all
  end

  def save
    if params[:id] == '0'
      # new
      if Position.create(name: params[:name], description: params[:description], lat: params[:lat], lng: params[:lng])
        @positions = Position.all
        render :partial => 'position/list', :locals => {:positions => @positions}
      end
    else
      # update
      pos = Position.find(params[:id])
      if pos.update_attributes(name: params[:name], description: params[:description], lat: params[:lat], lng: params[:lng])
        @positions = Position.all
        render :partial => 'position/list', :locals => {:positions => @positions}
      end
    end
  end

  def delete
    position = Position.find(params[:id])
    if position.destroy
      @positions = Position.all
      render :partial => 'position/list', :locals => {:positions => @positions}
    else
      render text: 'error'
    end
  end

end
