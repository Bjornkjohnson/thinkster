class Post < ActiveRecord::Base
  has_many :comments
  after_initialize :set_default_values

  def as_json(options = {})
    super(options.merge(include: :comments))
  end

  def set_default_values
    # Only set if time_zone IS NOT set
    self.upvotes ||= 0
  end
end
