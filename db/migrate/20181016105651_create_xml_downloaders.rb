class CreateXmlDownloaders < ActiveRecord::Migration[5.1]
  def change
    create_table :xml_downloaders do |t|
      t.string :xml_download

      t.timestamps
    end
  end
end
