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

class UnitsController < AdminController
  manage_restfully

  unroll

  list(:order => :name) do |t|
    t.column :label
    t.column :name
    t.column :coefficient
    t.column :base
    t.column :start
    t.action :edit
    t.action :destroy, :if => :destroyable?
  end

  # Displays the main page with the list of units
  def index
  end

  def load
    Unit.load_defaults
    redirect_to_current
  end

end
