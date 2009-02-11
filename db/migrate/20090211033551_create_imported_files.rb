class CreateImportedFiles < ActiveRecord::Migration
  def self.up
    create_table :imported_files do |t|
      t.string :content_type
      t.string :filename
      t.integer :size
      t.integer :file_type
      t.integer :status, :default => 0 

      t.timestamps
    end
  end

  def self.down
    drop_table :imported_files
  end
end
