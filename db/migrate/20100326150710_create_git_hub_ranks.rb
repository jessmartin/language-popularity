class CreateGitHubRanks < ActiveRecord::Migration
  def self.up
    create_table :git_hub_ranks do |t|
      t.integer :language_id
      t.integer :rank
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :git_hub_ranks
  end
end
