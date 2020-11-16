require "byebug"

def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
ending = ['.com', '.net', '.org', '.io' ]
urls.none? {|url| ending.include?(url[-3..-1]) || ending.include?(url[-4..-1])}
end

def any_passing_students?(students)
    students.any?{ |k, v| (k[:grades].sum / k[:grades].length) >= 75 }
end