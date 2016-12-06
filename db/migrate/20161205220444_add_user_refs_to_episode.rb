class AddUserRefsToEpisode < ActiveRecord::Migration[5.0]
  def change
    add_reference :episodes, :user, index: true, foreign_key: true
  end
end
