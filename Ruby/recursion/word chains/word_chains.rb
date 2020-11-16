require 'set'

class WordChainer
    def initialize(file_name)
        @dictionary = File.open(file_name, "r"){ |file| file.readlines.to_set}
        @current_words = []
        @all_seen_words = {}
    end
    def adjacent?(word, dict)
        count = 0
        word.each_char.with_index do |char, idx|
            count += 1 if char != dict[idx]
        end
        count == 1
    end
    def adjacent_words(word)
        adjacent = []
        @dictionary.each do |dict|
            adjacent << dict.chomp if word.length == dict.chomp.length && adjacent?(word, dict)
        end
        return adjacent
    end
    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                next if @all_seen_words.include?(adjacent_word)
                new_current_words << adjacent_word
                @all_seen_words[adjacent_word] = current_word
            end
        end
        new_current_words.each { |word| [word, @all_seen_words[word]]}
        @current_words = new_current_words
    end
    def build_path(target)
        array = [target]
        ele = target
        while !@all_seen_words[ele].nil?
            array << @all_seen_words[ele]
            ele = @all_seen_words[ele]
        end
        p array.reverse
    end
    def run(source, target)
        @current_words = [source]
        @all_seen_words = { source => nil}
        while !@current_words.empty?
            explore_current_words
        end
        build_path(target)
    end
end

chain = WordChainer.new("dictionary.txt")
chain.run("market", "rocket")