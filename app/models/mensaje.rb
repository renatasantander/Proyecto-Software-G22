class Mensaje < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  #after_create_commit { broadcast_append_to self.chat }

  validates :contenido, presence: true
end
