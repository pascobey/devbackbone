class Project < ApplicationRecord
    def get_backbone_document
        return JSON.parse(self.backbone_document.gsub('=>', ':')).stringify_keys
    end
    def get_weaknesses(doc)
        weaknesses = []
        if doc['leaders']['product_owner'] == doc['leaders']['scrum_master']
            weaknesses << 'In agile development, it is strongly advised that the scrum master and product owner not be the same person.'
        end
        doc['sprint'].each do |event, time|
            if time == ''
                if event.split('_').size < 2
                    weaknesses << "No Sprint #{event.gsub('_', ' ')} date set."
                else
                    weaknesses << "No #{event.gsub('_', ' ')} meeting time set."
                end
            end
        end
        if doc['backlog']['user_stories'] == {}
            weaknesses << "No User Stories in the product backlog."
        end 
        return weaknesses
    end
end
