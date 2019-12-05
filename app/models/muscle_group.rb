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

  def lifts
    return Lift.where({ :prim_mg => self.id}).or(Lift.where({ :sec_mg => self.id})).order({ :lift_name => :asc })
  end

  def executions
    lift_array = Lift.where({ :prim_mg => self.id }).or(Lift.where({ :sec_mg => self.id }))
    executions_array = Execution.where({ :lift_id => lift_array }).order({ :created_at => :desc })
    return executions_array
  end

end