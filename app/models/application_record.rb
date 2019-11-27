class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date.beginning_of_day, end_date.end_of_day)}
end
