class Wiki

  include Mongoid::Document
  include Mongoid::Slug

  attr_accessible :title, :public, :viewers, :collaborators, :author_id

  field :title, type: String
  field :public, type: Boolean, :default => true

  # Define relations
  belongs_to :author, class_name: "User", inverse_of: :wikis
  has_many :sections, inverse_of: :wiki
  has_and_belongs_to_many :viewers, class_name: "User", inverse_of: :viewable_wikis
  has_and_belongs_to_many :collaborators, class_name: "User", inverse_of: :editable_wikis

  validates_presence_of :author
  validates_presence_of :title
  validates_uniqueness_of :title

  # Define slug on title field
  slug :title

end
