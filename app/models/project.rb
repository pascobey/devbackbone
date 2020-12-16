class Project < ApplicationRecord

    has_one :change_log
    has_many :categories
    
    def backbone_document_safe
        if self.backbone_document.class != Hash
            JSON.parse(self.backbone_document.gsub('=>', ':')).stringify_keys
        else
            self.backbone_document
        end
    end

    def get_weaknesses
        doc = self.backbone_document_safe
        weaknesses = []
        if doc['leaders']['product_owner'] == doc['leaders']['scrum_master']
            weaknesses << 'In agile development, it is strongly advised that the scrum master and product owner not be the same person.'
        end
        doc['sprint'].each do |event, time|
            if time == ''
                if event.split('_').size < 2
                    weaknesses << "Sprint #{event.gsub('_', ' ')} date not set."
                else
                    weaknesses << "No #{event.gsub('_', ' ')} meeting time set."
                end
            end
        end
        if doc['backlog']['user_stories'] == []
            weaknesses << "The product backlog is empty."
        end 
        return weaknesses
    end

end
