class Issue < ActiveRecord::Base
  attr_accessible :description, :no_followers, :title ,:tags

  validates_presence_of :title
  validates_uniqueness_of :title ,message: "title should be unique sir"
  validates_numericality_of :no_followers,allow_blank: true
  validates_with Yesnovalidator

  belongs_to :project

  after_create :add_to_timeline
  before_save :strip_tag_space

  private 

  def add_to_timeline
  	Timeline.create!({content: "an issue was created!",timelineable_type: self.class.to_s,timelineable_id: id })
  end

  def strip_tag_space
    self.tags.gsub! ", ", ","
  end
end
