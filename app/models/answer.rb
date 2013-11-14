class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :votes, type: Integer, default: 0

  belongs_to :user
  belongs_to :question

  validates :body, presence: true,
                   length: { maximum: 140 }

  def upvote
    inc(:votes, 1)
  end

  def downvote
    dec(:votes, 1)
  end
end
