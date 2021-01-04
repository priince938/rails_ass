class Employee < ApplicationRecord
    mount_uploader :avatar, AvatarUploader # to link  uploder 
    validates :name, :city_id ,presence: true # validation use to check the presenence 
    has_one :city # one to one relation with city model 
    # self join in employee table
    has_many :subordinates, class_name: "Employee", foreign_key: "manager_id" 
    belongs_to :manager, class_name: "Employee", optional: true
end
