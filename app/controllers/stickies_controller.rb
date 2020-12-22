class StickiesController < ApplicationController

  def move
    sticky = Sticky.find(params[:id])
    sticky.insert_at(params[:position].to_i)
    if params[:category_id]
      sticky.update(category_id: params[:category_id].to_s)
    end
    head :ok
  end

end
