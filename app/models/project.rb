class Project < ApplicationRecord
    def get_backbone_document
        return JSON.parse(self.backbone_document.gsub('=>', ':')).stringify_keys
    end
    def get_weaknesses(doc)
        weaknesses = []
        if doc['leaders']['project_manager'] == doc['leaders']['scrum_master']
            weaknesses << 'In agile development, it is strongly advised that the scrum master and project manager not be the same person.'
        end
        return weaknesses
    end
end
