require 'rainbow/ext/string'

module TaskManager

  class Writer

    # Outputs text to the terminal and makes coloring
    # @param data [Hash] all tasks from database
    # @return [String] colored output to the terminal
    def self.output_data(data)
      data.each do |task|
        case task[1]
          when 0
            puts "Task: #{task[0]} is not yet finished".color(:red)
          when 1
            puts "Task #{task[0]} is finished at".color(:green)
        end
      end
    end


    # Writes error messages to the terminal
    # @param msg [String] error message identifier
    # @param task [String] name of the actual task
    # @return [String] output to the terminal
    def self.write_error(msg, task)
      case msg
        when 'invalid_task'
          puts "Task named: #{task} does not exist".color(:red)
        when 'create_failure'
          puts "Task named: #{task} could not be created".color(:red)
      end
    end

    # Writes success messages to the terminal
    # @param msg [String] success message identifier
    # @param task [String] name of the actual task
    # @return [String] output to the terminal
    def self.write_success(msg, task)
      case msg
        when 'delete_success'
          puts "Task named: #{task} was successfully deleted".color(:green)
        when 'create_success'
          puts "Task named: #{task} was successfully created".color(:green)
        when 'update_success'
          puts "Task named: #{task} was successfully finished at #{Time.now}".color(:green)
      end
    end

    # Writes static help block to the terminal
    # @output [String] output to the terminal
    def self.write_help
      puts """
        Commands: new {task name}       -- creates new task
                  show                  -- displays all tasks
                  mark_done {task name} -- marks task as finished
                  delete {task name}    -- deletes task
                  help                  -- shows help block
      """.color(:yellow)
    end
  end
end