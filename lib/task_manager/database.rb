require 'sqlite3'

module TaskManager

  class Database
    # Creates new database
    # @param db_name [String] database name
    def initialize(db_name)
      @db = SQLite3::Database.new db_name
      @db.execute <<-SQL
        create table tasks (
          name varchar(30),
          done integer(1)
      )
      SQL
    end


    # Saves new task into database
    # @param db_name [String] database name
    # @param table_name [String] table name
    # @param data [Hash] new task
    # @return [String] output to the terminal
    def self.save(db_name, table_name, data)
      @db = SQLite3::Database.new db_name
      begin
        @db.execute("INSERT INTO #{table_name} (name, done)
                      VALUES (?,?)", [data[:name], 0])
        TaskManager::Writer.write_success('create_success', data[:name])
      rescue SQLite3::Exception
        TaskManager::Writer.write_error('create_failure', task)
      end
    end

    # Deletes task from database
    # @param db_name [String] database name
    # @param table_name [String] table name
    # @param task [String] task name
    # @return [String] output to the terminal
    def self.delete(db_name, table_name, task)
      @db = SQLite3::Database.new db_name

      begin
        @db.execute("DELETE  FROM #{table_name} WHERE name = (?)", [task])
        TaskManager::Writer.write_success("delete_success", task)
      rescue SQLite3::Exception
        TaskManager::Writer.write_error("invalid_task", task)
      end
    end

    # Shows all tasks in database
    # @param db_name [String] database name
    # @param table_name [String] table name
    # @return [String] output to the terminal
    def self.show(db_name, table_name)
      @db = SQLite3::Database.new db_name
      data = @db.execute("SELECT * FROM #{table_name}")
      TaskManager::Writer.output_data(data)
    end

    # Deletes database
    # @param db_name [String] database name
    def self.drop(db_name)
      @db = SQLite3::Database.new db_name
      @db.execute("DROP TABLE tasks")
    end

    # Marks task as finished
    # @param db_name [String] database name
    # @param table_name [String] table name
    # @param task [String] task name
    # @return [String] output to the terminal
    def self.update(db_name, table_name, task)
      @db = SQLite3::Database.new db_name
      begin
        @db.execute("UPDATE #{table_name} SET done = 1 WHERE name = (?)", [task])
        TaskManager::Writer.write_success('update_success', task)
      rescue SQLite3::Exception
        TaskManager::Writer.write_error('invalid_task', task)
      end
    end

  end

end