# -*- coding: utf-8 -*-
# == License
# Ekylibre - Simple ERP
# Copyright (C) 2008-2011 Brice Texier, Thibaud Merigon
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

class SequencesController < AdminController
  manage_restfully :number_format=>"'[number|8]'", :last_number=>"0"

  unroll

  list do |t|
    t.column :name
    t.column :compute
    t.column :number_format, :class=>:code
    t.column :usage
    t.column :period
    t.action :edit
    t.action :destroy, :if=>"RECORD.destroyable\?"
  end

  # Displays the main page with the list of sequences
  def index
  end

  # Load missing sequences for current company
  def load
    Sequence.load_defaults
    redirect_to_current
  end

end
