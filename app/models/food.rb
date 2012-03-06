class Food < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :properties

  before_validation :set_uuid, :on => :create

  def to_json(options = {})
    options[:include] = :properties
    super(options)
  end

  private
  def set_uuid
    self.uuid = UUIDTools::UUID.timestamp_create
  end
end