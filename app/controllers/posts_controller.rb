class PostsController < ApplicationController

    def new
        # Users are not allowed to create a new post without login
        if !logged_in?
            flash[:danger] = "Please log in before creating a new post!"
            redirect_to login_path
        end
        @post = Post.new
    end
    
    def index
        # If keyword is present from the request
        if params[:keyword]
            # Remove all toggled topics
            clearAllToggleTopics
            # Set filter to false (Non toggle) as it is searched by keyword
            filterPost(false)
            # Return the posts that contains the keyword
            return @posts = Post.searchByKeyword(params[:keyword]) 
        end

        # Else return the recent post
        @posts = Post.all.created_between(1.month.ago, Time.now)
        @users = User.all
        
        # Return all recent posts if filter post status is false
        return @posts if !currentFilterPostStatus

        # Return all selected posts if filter post status is true
        return @posts = Post.where(topic_id: currentToggledTopics) if currentFilterPostStatus
    end

    def show
        @post = Post.find_by(id: params[:id])
        # Update the view if only the post is found
        @post.update_attributes(view: @post.view + 1) if @post
    end

    def create
        # Using temp variable since strong params is imutable
        create_params = post_params
        # Add in the view count
        create_params[:view] = 0
        # If no topic is selected, it will have "News" as topic
        if create_params[:topic_id] == ""
            create_params[:topic_id] = Topic.find_by(name: "News").id
        end
        
        @post = Post.new(create_params)

        if @post.save
            redirect_to home_path
        else
            render "new"
        end
    end

    # Controller method to dynamically update the live view count
    def view_count
        @post = Post.find_by(id: params[:id])
        respond_to do |format|
          format.js
        end
    end

    # To set the filter boolean when user clicks on selected post or recent post
    def filter_post
        # Set the status using PostsHelperMethod
        if (params[:filtertype] == "recent")
            # Remove all toggled topics
            clearAllToggleTopics
            filterPost(false)
        elsif (params[:filtertype] == "selected")
            filterPost(true) 
        end
        # Redirect back to index
        redirect_to home_path
    end

    private

    # params that is require for title
    def post_params
        params.require(:post).permit(:title, :content, :topic_id, :user_id)
    end

end
