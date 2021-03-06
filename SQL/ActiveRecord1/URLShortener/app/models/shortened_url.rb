# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true
    validates :user_id, presence: true

    belongs_to(
        :submitter,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id
    )

    has_many(
        :visits,
        class_name: "Visit",
        foreign_key: :shortened_url_id,
        primary_key: :id
    )

    has_many(
        :visitors,
        Proc.new { distinct }, #<<<
        through: :visits,
        source: :visitor
    )

    has_many(
        :taggings,
        class_name: :Tagging,
        foreign_key: :shortened_url_id,
        primary_key: :id
    )

    has_many(
        :tag_topics
        through: :taggings
        source: :tag_topic
    )

    def self.random_code
        while true
            short = SecureRandom.urlsafe_base64
            if !ShortenedUrl.exists?(:short_url => short)
                break
            end
        end
        return short
    end

    def self.create_for_user_and_long_url(user, long_url)
        ShortenedUrl.create!(
            user_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end

    def num_clicks
        return visits.count
    end

    def num_uniques
        return visitors.count
    end

    def num_recent_uniques
        return visits.where('created_at < ?', 10.minutes.ago).distinct.count
    end
end
