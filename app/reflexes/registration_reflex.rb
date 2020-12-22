class RegistrationReflex < ApplicationReflex

    def toggle_email_approval
        puts
        puts @checked_email
        puts element.value
        puts
        @checked_email = true
    end

end