class Reserva < ApplicationRecord
  belongs_to :user
  belongs_to :producto
  has_one :chat, dependent: :destroy

  validates :descripcion, presence: true 
  validates :cantidad_productos, presence: true, numericality: { only_integer: true }
  validates :estado, presence: true 

  serialize :empleados_ids, Array
  # has_many :user_reservas, dependent: :destroy
  # has_many :users, through: :user_reservas
  # has_and_belongs_to_many :users
end


