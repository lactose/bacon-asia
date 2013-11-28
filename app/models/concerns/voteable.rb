module Voteable
  extend ActiveSupport::Concern
  include Mongoid::Persistable

  included do
    field :votes, type: Integer, default: 0
  end

  def upvote!
    inc(votes: 1)
    save!
    self
  end

  def downvote!
    inc(votes: -1)
    save!
    self
  end
end