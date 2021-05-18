class Post < ApplicationRecord

  attachment :post_image

  belongs_to :user, optional: true

  enum category:{
  新製品:1,資材:2,出荷調整:3
  }

end
