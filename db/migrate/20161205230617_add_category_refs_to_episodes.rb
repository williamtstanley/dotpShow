class AddCategoryRefsToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :episodes, :category, index: true, foreign_key: true
  end
end
