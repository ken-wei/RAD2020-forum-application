module PostsHelper

    def filterPost(filter)
        session[:filter_post] = filter
    end

    def currentFilterPostStatus
        return session[:filter_post]
    end

end
