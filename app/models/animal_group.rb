# = Informations
# 
# == License
# 
# Ekylibre - Simple ERP
# Copyright (C) 2009-2013 Brice Texier, Thibaud Merigon
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
# 
# == Table: animal_groups
#
#  age_max      :integer          
#  age_min      :integer          
#  comment      :text             
#  created_at   :datetime         not null
#  creator_id   :integer          
#  description  :text             
#  id           :integer          not null, primary key
#  lock_version :integer          default(0), not null
#  name         :string(255)      not null
#  pregnant     :boolean          not null
#  sex          :string(16)       
#  updated_at   :datetime         not null
#  updater_id   :integer          
#


class AnimalGroup < CompanyRecord
  enumerize :sex, :in => [:male, :female], :predicates => true
  has_many :animals, :foreign_key => :group_id
  has_many :events, :class_name => "AnimalEvent", :foreign_key => :animal_group_id
  has_many :treatments, :class_name => "AnimalTreatment", :through => :events
  #[VALIDATORS[ Do not edit these lines directly. Use `rake clean:validations`.
  validates_numericality_of :age_max, :age_min, :allow_nil => true, :only_integer => true
  validates_length_of :sex, :allow_nil => true, :maximum => 16
  validates_length_of :name, :allow_nil => true, :maximum => 255
  validates_inclusion_of :pregnant, :in => [true, false]
  validates_presence_of :name
  #]VALIDATORS]
  validates_uniqueness_of :name
  validates_inclusion_of :sex, :in => self.sex.values
end
