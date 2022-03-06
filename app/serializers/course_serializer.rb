class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :teacher_id
end
