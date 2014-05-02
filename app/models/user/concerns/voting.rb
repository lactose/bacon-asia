class User
  module Concerns
    module Voting
      extend ActiveSupport::Concern

      included do
        has_many :votes, class_name: 'User::Vote'
      end

      def toggle_vote!(voteable)
        return unless voteable.kind_of?(Voteable)

        if vote = fetch_vote(voteable)
          vote.destroy
        else
          votes.create!(voteable: voteable)
        end

        self
      end

      def fetch_vote(voteable)
        votes.where(voteable: voteable).first
      end
    end
  end
end
