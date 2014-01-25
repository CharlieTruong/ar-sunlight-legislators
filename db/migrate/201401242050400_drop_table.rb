require 'csv'
require_relative '../config'


class DropTable < ActiveRecord::Migration
  def change
    drop_table :legislators
  end
end


