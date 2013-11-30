module VotingController
  extend ActiveSupport::Concern

  def vote(voteable)
    if current_user
      current_user.toggle_vote!(voteable)
    else
      false
    end
  end
end
