class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :commenters_ips, through: :comments, source: "ip"
  has_and_belongs_to_many :categories
  def next_article
    Article.where("id > ?", id).order(:id).first
  end

  def capitalize_title
    self.title = self.title.capitalize
    save!
  end

  def self.search(q)
    Article.where("title like :query or text like :query", query: "%#{q}%")
  end

  scope :younger_than_week, -> { where("created_at > ?", 1.week.ago) }

end
