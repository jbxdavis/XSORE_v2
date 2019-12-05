# == Schema Information
#
# Table name: lifts
#
#  id         :integer          not null, primary key
#  category   :string
#  def_reps   :integer
#  def_sets   :integer
#  image      :string
#  lift_name  :string
#  prim_mg    :integer
#  sec_mg     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lift < ApplicationRecord
  #associations
  has_many :workouts, :class_name => "Execution", :dependent => :nullify
  belongs_to :primary_mg, :class_name => "MuscleGroup", :foreign_key => "prim_mg"
  belongs_to :secondary_mgs, :class_name => "MuscleGroup", :foreign_key => "sec_mg"

  #validations
  validates :category, :presence => { :message => "Must classify as push, pull, or ab/leg" }
  
  def executions
    return Execution.where({ :lift_id => self.id })
  end

end