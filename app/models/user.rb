class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, foreign_key: "poster_id"         
  has_many :likes, dependent: :destroy

  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy
    else 
      likes.where(item: item).create!
    end 
  end 

  def name_or_email
    name.presence || email
  end 

  def liking?(item)
    likes.where(item: item).exists?
  end 

end
