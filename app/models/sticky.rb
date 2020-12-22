class Sticky < ApplicationRecord
    acts_as_list
    scope :in_project, ->(project_id) { where('project_id = ?', project_id.to_i) }
    scope :in_category, ->(category_id) { where('category_id = ?', category_id.to_i) }
    scope :nil_category, -> { where('category_id is null') }
end
