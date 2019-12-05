# == Schema Information
#
# Table name: executions
#
#  id         :integer          not null, primary key
#  date       :date
#  reps       :integer
#  sets       :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lift_id    :integer
#  user_id    :integer
#

class Execution < ApplicationRecord
  #associations
  belongs_to :lift
  belongs_to :user

  #validations
  validates :weight, :presence => { :message => "Must include weight" }
  validates :user_id, :presence => true
  validates :sets, :presence => { :message => "Must include set count" }
  validates :reps, :presence => { :message => "Must include rep count" }
  validates :lift_id, :presence => true
  validates :date, :presence => { :message => "Must include a date." }

end
