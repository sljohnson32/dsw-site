class Track < ApplicationRecord

  # Add to ActiveAdmin as strong params
  # attr_accessible :name,
  #                 :icon,
  #                 :email_alias

  validates :name,
            :email_alias,
            :icon,
            :color, presence: true

  has_many :submissions, dependent: :destroy
  has_and_belongs_to_many :chairs, class_name: 'User'

  def self.in_display_order
    order('display_order ASC, name ASC')
  end

  def self.with_icon_and_color
    where('icon IS NOT NULL AND color IS NOT NULL')
  end

  def self.submittable
    where(is_submittable: true)
  end

  def name_for_partial
    name.downcase.tr(' ', '_')
  end
end
