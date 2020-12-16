class StickiesController < ApplicationController

  def move
    puts
    puts sticky = Sticky.find(params[:id])
    puts params[:position]
    puts
    sticky.insert_at(params[:position].to_i)
    head :ok
  end

end
