class User
  include Mongoid::Document
  include Mongoid::Slug
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :account_type, :wikis, :sections, :viewable_wikis, :editable_wikis

  # Add username to model
  field :name,               :type => String
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :account_type,       :type => String, :default => "free"
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time
  field :remember_created_at, :type => Time
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name, :email, :case_sensitive => false
  validates_inclusion_of :account_type, in: ["free", "premium"]

  # Create slug on unique name (username) field
  slug :name

  # Define relations
  has_many :wikis, inverse_of: :author
  has_many :sections, inverse_of: :author
  has_and_belongs_to_many :viewable_wikis, class_name: "Wiki", inverse_of: :viewers
  has_and_belongs_to_many :editable_wikis, class_name: "Wiki", inverse_of: :collaborators

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

end
