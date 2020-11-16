require_relative 'Main.rb'
require_relative 'User.rb'

class Question_Like
    attr_accessor :liker_id, :question_id, :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes q1
            WHERE
                q1.id = ?
        SQL
        data.map{|datum| Question_Like.new(datum)}
    end

    def self.likers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users u
            JOIN
                question_likes q ON u.id = q.user_id
            WHERE
                question_id = ?
        SQL
        data.map{|datum| User.new(datum)}
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(*)
            FROM
                users u
            JOIN
                question_likes q ON u.id = q.user_id
            WHERE
                question_id = ?
        SQL
        return data[0]["COUNT(*)"]
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN
                question_likes ON questions.id = question_likes.question_id
            WHERE
                question_likes.user_id = ?
        SQL
        data.map{|datum| Question.new(datum)}
    end

    def self.most_liked_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                question_likes ql
            GROUP BY
                ql.question_id
            ORDER BY
                COUNT(ql.question_id) DESC
            LIMIT
                ?
        SQL
        data.map{|datum| Question.find_by_id(datum["question_id"])}
    end

    def initialize(options)
        @user_id = options["user_id"]
        @question_id = options["questions_id"]
        @id = options["id"]
    end
end