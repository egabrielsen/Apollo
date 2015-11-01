module UserTemplates
  class MenuController < Volt::ModelController
    def show_name
      Volt.current_user.then do |user|
        # Make sure there is a user
        if user
          user._name || user._email || user._username
        else
          ''
        end
      end
    end

    def drop_down
      if `$(".dropdown-menu").css("display")` == "none"
        `$(".dropdown-menu").css("display", "block")`
      elsif
        `$(".dropdown-menu").css("display", "none")`
      end
    end

    def is_active?
      url.path.split('/')[1] == 'login'
    end

    def logout
      Volt.logout.then do |log|
        redirect_to "/"
      end.fail do |errors|
        flash._notices << errors
      end
    end

  end
end
