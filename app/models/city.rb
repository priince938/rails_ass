class City < ApplicationRecord
    before_validation :normalize_name  #callback use to save titlesize name before saving

    validates :name, presence: true ,uniqueness: { case_sensitive: true } # validation use to check presence and uniqueness 
    belongs_to :employee, :optional => true # one to one city belong to an employee 
    
    private
        def normalize_name
            self.name = name.titleize
        end
    
end
