class TopicsController < ApplicationController

    def update
        topic = Topic.find(params[:id])

        # If the previous toggled topic is the same as current toggle
        #   Untoggle it
        if isToggled?(topic)
            untoggleTopic(topic)
        else
            toggleTopic(topic)
        end

        # Redirect to homepage
        redirect_to home_path
    end
end
