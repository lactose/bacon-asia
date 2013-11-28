class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Voteable

  field :body, type: String

  belongs_to :user
  has_many :answers

  validates :body, presence: true,
                   length: { maximum: 140 }

  scope :trending, order_by([:votes, :desc])
end
