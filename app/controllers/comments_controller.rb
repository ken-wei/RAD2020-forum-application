class CommentsController < ApplicationController
    # Users can only comment after logged in
    before_action :logged_in_user, only: [:create]

    def create
        # Store the comment params inside a variable to modify it
        create_params = comment_params
        
        # Get current logged in user id
        create_params[:user_id] = current_user.id
        # Get the post id in order to create the comment
        create_params[:post_id] = params[:post_id]
        @comment = Comment.new(create_params)
        if @comment.save
            redirect_to post_path(params[:post_id])
        end
    end

    private

        def comment_params
            params.require(:comment).permit(:content)
        end

        def logged_in_user
            unless logged_in?
              flash[:danger] = "Please log in before commenting!"
              redirect_to login_path
            end
        end
end
