class CreateYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :youtube_videos do |t|
      t.string :url
      t.string :title
      t.integer :videoable_id
      t.string :videoable_type

      t.timestamps
    end
  end
end
