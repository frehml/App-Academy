# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint           not null, primary key
#  tag        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagTopic < ApplicationRecord
    validates :tag, presence: true
end
