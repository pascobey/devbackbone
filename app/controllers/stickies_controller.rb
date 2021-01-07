class StickiesController < ApplicationController

  def move
    sticky = Sticky.find(params[:id])
    sticky.insert_at(params[:position].to_i)
    if params[:category_id]
      sticky.update(category_id: params[:category_id].to_s)
      Entry.create(change_log_id: ChangeLog.find_by(project_id: params[:id]).id, committer_id: current_user.id, message: "#{Profile.find_by(user_id: current_user.id).user_information_safe['first_name']} moved a user story into #{Category.find(params[:category_id]).name}.", type_meta: 'backlog')
    end
    head :ok
  end

end
