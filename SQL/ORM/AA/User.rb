require_relative 'Main.rb'
require_relative 'Reply.rb'
require_relative 'Question.rb'
require_relative 'Question_Follow.rb'

class User
    attr_accessor :fname, :lname, :id

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users u1
        WHERE
            u1.fname = ? AND
            u1.lname = ?
        SQL
        data.map{|datum| User.new(datum)}
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users u1
        WHERE
            u1.id = ?
        SQL
        data.map{|datum| User.new(datum)}
    end

    def initialize(options)
        @fname = options["fname"]
        @lname = options["lname"]
        @id = options["id"]
    end

    def authored_questions
        return Question.find_by_author_id(@id)
    end

    def authored_replies
        return Reply.find_by_user_id(@id)
    end

    def followed_questions
        return Question_Follow.followed_questions_for_user_id(@id)
    end

    def liked_questions
        return Question_Like.liked_questions_for_user_id(@id)
    end

    def average_karma
        data = QuestionsDatabase.instance.execute(<<-SQL)
        SQL
    end

    def save
        if @id.nil?
            QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
                INSERT INTO
                    users (fname, lname)
                VALUES
                    (?,?)
            SQL
            @id = QuestionsDatabase.instance.last_insert_row_id
        else
            update
        end
    end

    def update
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
            UPDATE
                users
            SET
                fname = ?, lname=?
        SQL
    end

    def average_karma
        QuestionsDatabase.get_first_value(<<-SQL, author_id: self.id)
        SELECT
            CAST(COUNT(question_likes.id) AS FLOAT) /
            COUNT(DISTINCT(questions.id)) AS avg_karma
        FROM
            questions
        LEFT OUTER JOIN
            question_likes
        ON
            questions.id = question_likes.question_id
        WHERE
            questions.author_id = :author_id
        SQL
  end
end

