require "humanize_time"

module RedditHelpers
    extend self

    def time_to_string(time : Time) 
        HumanizeTime.distance_of_time_in_words(time, Time.local)
    end
end