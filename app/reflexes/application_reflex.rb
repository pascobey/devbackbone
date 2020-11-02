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
  
end
