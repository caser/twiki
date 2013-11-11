class Section
  include Mongoid::Document
  include Mongoid::Timestamps

  # Define fields
  field :title, type: String
  field :version, type: Integer
  field :content, type: String
  field :internal_id, type: Integer

  # Define relations
  belongs_to :author, class_name: "User", inverse_of: :sections
  belongs_to :wiki

  # Validate fields
  validates_presence_of :title, :version, :internal_id
  validates :wiki, presence: true
  validates :author, presence: true
end
