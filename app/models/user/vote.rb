class User
  class Vote
    include Mongoid::Document
    include Mongoid::Timestamps

    after_create :increase_vote
    after_destroy :decrease_vote

    belongs_to :user
    belongs_to :voteable,
               polymorphic: true

    def increase_vote
      self.voteable.inc(vote_count: 1)
    end

    def decrease_vote
      self.voteable.inc(vote_count: -1)
    end

  end
end
