# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  # Put application wide Reflex behavior in this file.
  #
  # Example:
  #
  #   # If your ActionCable connection is: `identified_by :current_user`
  #   delegate :current_user, to: :connection
  #
  # Learn more at: https://docs.stimulusreflex.com

  def reinstantiate_vars(vars_string)
    vars_hash = JSON.parse(vars_string).stringify_keys
    vars_hash.each do |k, v|
        instance_variable_set("@#{k}", v)
    end
  end

  def save_and_log(bbd)
      project = Project.find(params[:id])
      change_log = ChangeLog.find_by(project_id: project.id)
      context = (bbd.to_a - project.backbone_document_safe.to_a)[0][0]
      if project.backbone_document_safe[context].class == Hash
        if project.backbone_document_safe[context].keys.first == 'user_stories'
          if bbd[context][bbd[context].keys.first].size > project.backbone_document_safe[context][project.backbone_document_safe[context].keys.first].size
            story = bbd[context][bbd[context].keys.first] - project.backbone_document_safe[context][project.backbone_document_safe[context].keys.first]
            Entry.create(change_log_id: change_log.id, committer_id: @user_id.to_i, message: "Story added to backlog: #{story[0]['story']}, Value: #{story[0]['value']}")
          elsif bbd[context][bbd[context].keys.first].size < project.backbone_document_safe[context][project.backbone_document_safe[context].keys.first].size
            story = project.backbone_document_safe[context][project.backbone_document_safe[context].keys.first] - bbd[context][bbd[context].keys.first]
            Entry.create(change_log_id: change_log.id, committer_id: @user_id.to_i, message: "Story removed from backlog: #{story[0]['story']}, Value: #{story[0]['value']}")
          end
        elsif project.backbone_document_safe[context][project.backbone_document_safe[context].keys.first].class == Array
          project.backbone_document_safe[context].each do |key, array|
            if bbd[context][key].size > array.size
              profile = Profile.find_by(user_id: (bbd[context][key] - array).first)
              Entry.create(change_log_id: change_log.id, committer_id: @user_id.to_i, message: "#{profile.user_information_safe['first_name']} #{profile.user_information_safe['last_name']} added to #{context}.")
            elsif bbd[context][key].size < array.size
              profile = Profile.find_by(user_id: (array - bbd[context][key]).first)
              Entry.create(change_log_id: change_log.id, committer_id: @user_id.to_i, message: "#{profile.user_information_safe['first_name']} #{profile.user_information_safe['last_name']} removed from #{context}.")
            end
          end
        elsif bbd[context][bbd[context].keys.first].class == String
          change = bbd[context].to_a - project.backbone_document_safe[context].to_a
          Entry.create(change_log_id: change_log.id, committer_id: @user_id.to_i, message: "Sprint #{change[0][0].gsub('_', ' ')} changed to #{change[0][1]}.")
        end
      end
      project.update(backbone_document: bbd)
  end
  
end
