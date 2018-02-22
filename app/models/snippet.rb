class Snippet < ActiveRecord::Base
  validates :body, presence: true
  scope :public_all, -> { where(is_private: false) }
  scope :recent, ->(num) { public_all.order('created_at DESC').limit(num) }
  validates :slug, uniqueness: true, :allow_blank => true
  before_create :generate_slug

  protected

  def generate_slug
    self.slug = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Snippet.exists?(slug: random_token)
    end
  end
end
