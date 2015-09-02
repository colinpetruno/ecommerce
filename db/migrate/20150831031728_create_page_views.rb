class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.string :session_id
      t.integer :user_id
      t.string :page_url
      t.string :page_parameters
      t.string :user_agent
      t.string :ip_address
      t.string :location
      t.string :operating_system
      t.string :browser
      t.string :browser_version
      t.string :browser_major_version
      t.string :referrer
      t.string :utm_source
      t.string :utm_medium
      t.string :utm_term
      t.string :utm_content
      t.string :utm_campaign

      t.timestamps null: false
    end
  end
end
