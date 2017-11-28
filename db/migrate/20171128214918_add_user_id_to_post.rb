class AddUserIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user, foreign_key: true

    user = User.first

    Post.all.each do |post|
      post.user_id = user.id
      post.save
    end
  end
end
