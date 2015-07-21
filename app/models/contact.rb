class Contact < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :cell_number
  has_and_belongs_to_many :messages


end
