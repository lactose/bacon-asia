class User
  module Concerns
    module Voting
      extend ActiveSupport::Concern

      included do
        has_many :votes, class_name: 'User::Vote'
      end

      def toggle_vote!(voteable)
        return unless voteable.respond_to?(:voteable?)

        if vote = fetch_vote(voteable)
          vote.destroy
          voteable.inc(vote_count: -1)
        else
          votes.create!(voteable: voteable)
          voteable.inc(vote_count: 1)
        end

        self
      end

      def fetch_vote(voteable)
        votes.where(voteable: voteable).first
      end
    end
  end
end
