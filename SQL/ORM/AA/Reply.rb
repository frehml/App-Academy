require_relative 'Main.rb'
require_relative 'User.rb'
require_relative 'Question.rb'

class Reply
    attr_accessor :body, :id, :parent_id, :author_id, :question_id
    
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies r1
            WHERE
                r1.id = ?
        SQL
        data.map{|datum| Reply.new(datum)}
    end
    
    def self.find_by_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                author_id = ?
        SQL
        data.map{|datum| Reply.new(datum)}
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE 
                question_id = ?
        SQL
        data.map{|datum| Reply.new(datum)}
    end

    def initialize(options)
        @body = options["body"]
        @id = options["id"]
        @parent_id = options["parent_id"]
        @author_id = options["author_id"]
        @question_id = options["question_id"]
    end

    def author
        return User.find_by_id(@author_id)
    end

    def question
        return Question.find_by_id(@question_id)
    end

    def parent_reply
        return if @parent_id.nil?

        data = QuestionsDatabase.instance.execute(<<-SQL, @parent_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        data.map{|datum| Reply.new(datum)}
    end

    def child_replies
        data = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        data.map{|datum| Reply.new(datum)}
    end
end