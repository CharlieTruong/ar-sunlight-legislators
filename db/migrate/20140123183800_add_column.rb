require 'csv'
require_relative '../config'


class AddColumn < ActiveRecord::Migration
  def change
    add_column :congress_members, :in_office, :boolean
  end
end

