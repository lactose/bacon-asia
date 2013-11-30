module Voteable
  extend ActiveSupport::Concern
  include Mongoid::Persistable

  included do
    field :vote_count,        type: Integer, default: 0
    has_many :votes,
             class_name: 'User::Vote',
             as: :voteable

    scope :recent, ->(limit = 50) { where(:created_at.gte => Date.today).limit(limit) }
    scope :trending, ->(limit = 50) { where(:vote_count.gte => 5).limit(limit) }
    scope :popular, order_by([:vote_count, :desc])
  end

  def voteable?
    true
  end

  def votes
    self.up_votes - self.down_votes
  end
end
