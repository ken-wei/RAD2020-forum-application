module ApplicationHelper
    
    # Active class for styling for the nav bar header inside My Profile Settings
    def active_class(action)
        (controller_name == 'users' && 
        action.include?(action_name)) ? 'info-active' : ''
    end

    # active class for styling left side bar inside My Profile Settings
    def active_sidebar(link_path)
        current_page?(link_path) ? 'sidebar-active' : ''
    end

    # active class for "Setting" when it is rendering all settings path
    # (password change, upload avatar, personal info and verification)
    def active_sidebar_setting
        (controller_name == 'users' && 
        ['updatePassword', 'setting',
            'verification', 'uploadVerification', 'update', 
            'avatar', 'password'].include?(action_name)) ? 'sidebar-active' : ''
    end         

    # To check if it's the homepage to enable toggle and if filter is true
    def homePageToEnableToggle?
        return true if current_page?(home_path) && currentFilterPostStatus
        return false if !current_page?(home_path) || !currentFilterPostStatus
    end
end
