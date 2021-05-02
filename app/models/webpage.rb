class Webpage < ApplicationRecord
  belongs_to :user

  has_attached_file :logo, styles: { medium: "600x300>", thumb: "100x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_attached_file :cover, styles: { thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/, size: { in: 0..250.megabytes }

  def as_json(_opts = {})
    {
      ig_handle: ig_handle,
      page_name: page_name,
      cover: {url: cover.url},
      description: description,
      video_link: video_link,
      logo: {url: logo.url},
      errors: errors
    }
  end
end
