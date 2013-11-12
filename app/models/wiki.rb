class Wiki

  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :visibility, type: String, :default => "public"

  attr_accessible :title, :visibility, :viewers, :collaborators

  # Define relations
  belongs_to :author, class_name: "User", inverse_of: :wikis
  has_many :sections
  has_and_belongs_to_many :viewers, class_name: "User", inverse_of: :viewable_wikis
  has_and_belongs_to_many :collaborators, class_name: "User", inverse_of: :editable_wikis

  validates_presence_of :title
  validates_uniqueness_of :title

  # Define slug on title field
  slug :title

  validates :author, presence: true

end
