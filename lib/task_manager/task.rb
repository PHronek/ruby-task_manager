module TaskManager

  class Task


    # Creates new task
    # @param name [String] new task name
    # @return [Hash] hash containing task values
    def self.new(name)
      {:name => name}
    end

  end

end