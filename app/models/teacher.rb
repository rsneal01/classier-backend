class Teacher < ApplicationRecord
    has_many :courses
    validates :name, presence: true
end
