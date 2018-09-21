class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        string = slug.gsub('-', ' ')
        Artist.all.each do |artist|
            if string == artist.name.downcase
                return artist
            end
        end
    end

end