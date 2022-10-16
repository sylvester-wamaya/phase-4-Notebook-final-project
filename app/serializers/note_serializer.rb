class NoteSerializer < ActiveModel::Serializer
  attributes :id, :notes, :updated_at, :created_at
end
