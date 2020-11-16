require_relative 'Main.rb'
require_relative 'User.rb'
require_relative 'Question.rb'

class Question_Follow
attr_accessor :question_id, :author_id, :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows q1
            WHERE
                q1.id = ?
        SQL
        data.map{|datum| Question_Follow.new(datum)}
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users u1
            JOIN
                question_follows q1 ON u1.id = q1.user_id
            WHERE
                q1.question_id = ?
        SQL
        data.map{ |datum| User.new(datum)}
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions q
            JOIN
                question_follows qf ON q.id = qf.question_id
            WHERE
                qf.user_id = ?
        SQL
        data.map{|datum| Question.new(datum)}
    end

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                question_follows qf
            GROUP BY
                qf.question_id
            ORDER BY
                COUNT(qf.question_id) DESC
            LIMIT
                ?
        SQL
        data.map{|datum| Question.find_by_id(datum["question_id"])}
    end

    def initialize(options)
        @question_id = options["question_id"]
        @user_id = options["user_id"]
        @id = options["id"]
    end
end