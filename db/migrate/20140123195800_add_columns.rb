require 'csv'
require_relative '../config'


class AddColumns < ActiveRecord::Migration
  def change
    add_column :congress_members, :type, :string
  end
end

