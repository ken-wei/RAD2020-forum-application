class ApplicationController < ActionController::Base
    include SessionsHelper
    include TopicsHelper
    include PostsHelper
    include UsersHelper
    
end
