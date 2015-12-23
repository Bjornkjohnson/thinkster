class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  after_initialize :set_default_values

  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}]))
  end

  def set_default_values
    # Only set if time_zone IS NOT set
    self.upvotes ||= 0
  end
end
