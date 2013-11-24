class Section
  include Mongoid::Document
  include Mongoid::Timestamps

  # TODO - decide if this should be before_save or before_update
  before_update :save_old_version

  attr_accessible :title, :content, :internal_id

  # Define fields
  field :title, type: String
  field :content, type: String
  field :internal_id, type: Integer
  field :diffs, type: Array, default: []

  # Define relations
  belongs_to :author, class_name: "User", inverse_of: :sections
  belongs_to :wiki, inverse_of: :sections
  # belongs_to :master_version, class_name: "Section", inverse_of: :old_versions
  # embeds_many :old_versions, class_name: "Section", inverse_of: :master_version

  # Validate fields
  validates_presence_of :title, :internal_id, :content
  validates :wiki, presence: true
  validates :author, presence: true

  protected

  def save_old_version
    changes = self.changes
    self.diffs << changes
  end

end
