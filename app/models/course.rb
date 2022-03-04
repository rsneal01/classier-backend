class Course < ApplicationRecord
    belongs_to :teacher
    validates :title, presence: true
end
