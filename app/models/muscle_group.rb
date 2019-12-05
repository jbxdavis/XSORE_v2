# == Schema Information
#
# Table name: muscle_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MuscleGroup < ApplicationRecord
  #associations
  has_many :lifts, :foreign_key => "prim_mg"
  has_many :support_lifts, :class_name => "Lift", :foreign_key => "sec_mg", :dependent => :nullify

end
