class AddHashtagsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :hashtags, :text
  end
end
