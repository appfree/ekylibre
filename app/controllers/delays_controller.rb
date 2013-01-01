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

class DelaysController < AdminController
  manage_restfully

  unroll

  list do |t|
    t.column :name, :url => true
    t.column :active
    t.column :expression
    t.column :comment
    t.action :edit
    t.action :destroy
  end

  # Displays details of one delay selected with +params[:id]+
  def show
    return unless @delay = find_and_check(:delay)
    t3e @delay.attributes
  end

  # Displays the main page with the list of delays
  def index
  end

end
