module EmployeesHelper
    # to check wheather the current user is admin or not
    def new_emp
        if user_signed_in? && current_user.admin
            "<a href='#{new_employee_path}'>Add employee</a>".html_safe
        end
    end
    def edit_emp(employee)
        if user_signed_in? && current_user.admin
            "<a href='#{edit_employee_path(employee)}'>Edit</a>".html_safe
        end
    end
end
