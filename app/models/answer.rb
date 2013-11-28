class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Voteable

  field :body, type: String

  belongs_to :user
  belongs_to :question

  validates :body, presence: true,
                   length: { maximum: 140 }
end
