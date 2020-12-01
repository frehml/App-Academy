require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    belongs_to(
        :submitter, 
        class_name: 'User',
        foreign_key: 'submitter_id',
        primary_key: 'id'
    )

    def self.random_code
        while true 
            url = SecureRandom.urlsafe_base64
            if !ShortenedUrl.exists?(short_url: url)
                return url
            end
        end
    end

    def self.make(user, l_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: l_url, 
            short_url: ShortenedUrl.random_code
        )
    end
end