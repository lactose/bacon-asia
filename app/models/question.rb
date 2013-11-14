class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String

  belongs_to :user
  has_many :answers

  validates :body, presence: true,
                   length: { maximum: 140 }

  scope :trending, order_by([:created_at, :desc])
end
