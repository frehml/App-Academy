require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true
    validates :user_id, presence: true

    belongs_to(
        :submitter,
        class_name: "User"
        foreign_key: :user_id
        primary_key: :id
    )

    def self.random_code
        while true
            short = SecureRandom.urlsafe_base64
            if !ShortenedUrl.exists?(:short_url => short)
                break
        end
        return short
    end

    def self.create_for_user_and_long_url(user, long_url)
        ShortenedUrl.create!(
            user_id: user.id
            long_url: long_url
            short_url: ShortenedUrl.random_code
        )
    end
end