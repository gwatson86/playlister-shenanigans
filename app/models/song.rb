class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        string = slug.gsub('-', ' ')
        Song.all.each do |song|
            if string == song.name.downcase
                return song
            end
        end
    end
end