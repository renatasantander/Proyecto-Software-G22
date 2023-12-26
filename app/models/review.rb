class Review < ApplicationRecord
  belongs_to :producto
  validates :titulo, presence: true 
  validates :calificacion, presence: true, numericality: {only_float: true}
  validates :contenido, presence: true
  belongs_to :user
end
