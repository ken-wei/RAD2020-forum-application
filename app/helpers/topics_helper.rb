module TopicsHelper

    # Create a session array if it's empty
    #   Append to it if not empty
    def toggleTopic(topic)
        (session[:topics] ||= []) << topic.id
    end

    # Remove topic from the session array
    def untoggleTopic(topic)
        session[:topics].delete(topic.id)
    end

    # To check if there's any toggled topic
    def anyToggled?
        session[:topics].nil?
    end

    # Return current toggled topics
    def currentToggledTopics
        topics = session[:topics]
    end

    # Check if a topic has been toggled
    def isToggled?(topic)
        return false if session[:topics].nil?
        session[:topics].include? topic.id
    end

    # Remove all toggled topics
    def clearAllToggleTopics
        session.delete(:topics)
    end

end
