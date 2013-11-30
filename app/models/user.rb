class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Concerns::OmniAuth
  include Concerns::Voting

  field :email,            type: String
  field :first_name,       type: String
  field :last_name,        type: String
  field :name,             type: String
  field :admin,            type: Boolean, default: false
  field :super_admin,      type: Boolean, default: false

  index({ email: 1 }, { unique: true })
  validates :email, presence:   true,
                    uniqueness: { case_sensitive: false },
                    email:      true

  def self.find_by_email(email)
    regex = /^#{Regexp.quote(email.to_s)}$/i
    where(email: regex).first
  end

  def associate_questions(ids)
    Question.any_in(id: ids).each do |question|
      question.user = self
      question.save!
    end
  end
end
