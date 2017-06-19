class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # since created_at is supported everywhere by most people, define it if
  # we're using ecto models
  def created_at
    if self.class.column_names.include? "created_at"
      self["created_at"]
    elsif self.class.column_names.include? "inserted_at"
      self["inserted_at"]
    else
      raise NoMethodError.new("undefined method", "created_at")
    end
  end

  # since created_at is supported everywhere by most people, define it if
  # we're using ecto models
  def created_at=(value)
    if self.class.column_names.include? "created_at"
      self.write_attribute("created_at", value)
    elsif self.class.column_names.include? "inserted_at"
      self.write_attribute("inserted_at", value)
    else
      raise NoMethodError.new("undefined method", "created_at=")
    end
  end

  private

  def self.timestamp_attributes_for_create
    ActiveRecord::Base.send(:timestamp_attributes_for_create) + ["inserted_at"]
  end
end
