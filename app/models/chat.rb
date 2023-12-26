class Chat < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_chats, -> { where(is_private: false) }
  #after_create_commit {broadcast_append_to "chats"}
  has_many :mensajes, dependent: :destroy
  belongs_to :reserva
  has_many :participantes, dependent: :destroy
  has_many :users, through: :participantes
end
