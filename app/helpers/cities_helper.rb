module CitiesHelper
    # to check wheather the current user is admin or not
    def new_city
        if user_signed_in? && current_user.admin
            "<a href='#{new_city_path}' >New city</a>".html_safe
        end
    end
    
    def edit_city(city)
        if user_signed_in? && current_user.admin
            "<a href='#{edit_city_path(city)}' >Edit</a>".html_safe
        end
    end

   
end
