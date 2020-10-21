class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :profile_image
    def self.all_containing(search)
        profiles = []
        if search.strip != ''
            search_items = search.split(' ')
            Profile.all.each do |p|
                p.user_information.values.each do |v|
                    search_items.each do |item|
                        if v.to_s.downcase.include?(item)
                            profiles << p
                        end
                    end
                end
            end
        else
            profiles = Profile.all.first(3)
        end
        return profiles
    end
end
