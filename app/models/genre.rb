class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        arr = slug.split('-')
        string = arr.join(' ').titleize
        Genre.find_by name: string
    end
end