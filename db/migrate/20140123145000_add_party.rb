require 'csv'
require_relative '../config'


class AddParty < ActiveRecord::Migration
  def change

    create_table :political_parties do |t|
      t.string :party_name
      t.timestamps
    end

  end
end

