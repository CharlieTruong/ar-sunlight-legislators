require 'csv'
require_relative '../config'


class AddTables < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state
      t.timestamps
    end

    create_table :political_partys do |t|
      t.string :party_name
      t.timestamps
    end

    create_table :congress_members do |t|
      t.string    :name
      t.string    :phone
      t.string    :fax
      t.string    :website
      t.string    :webform
      t.string    :gender
      t.date      :birthdate
      t.string    :twitter_id
      t.string    :title
      t.integer   :party_id
      t.integer   :state_id
      t.belongs_to :political_party
      t.belongs_to :state
      t.timestamps
    end
  end
end

