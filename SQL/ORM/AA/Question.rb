require_relative 'Main.rb'
require_relative 'User.rb'
require_relative 'Reply.rb'
require_relative 'Question_Follow.rb'
require_relative 'Question_Like.rb'

class Question
    attr_accessor :title, :body, :id, :author_id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions q1
            WHERE
                q1.id = ?
        SQL
        data.map{|datum| Question.new(datum)}
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        data.map{ |datum| Question.new(datum)}
    end

    def self.most_followed(n)
        return Question_Follow.most_followed_questions(n)
    end

    def self.most_liked(n)
        return Question_Like.most_liked_questions(n)
    end

    def initialize(options)
        @title = options["title"]
        @body = options["body"]
        @id = options["id"]
        @author_id = options["author_id"]
    end

    def author
        return User.find_by_id(@author_id)
    end

    def replies
        return Reply.find_by_question_id(@id)
    end

    def followers
        return Question_Follow.followers_for_question_id(@id)
    end

    def num_likes
        return Question_Like.num_likes_for_question_id(@id)
    end

    def likers
        return Question_Like.likers_for_question_id(@id)
    end
end