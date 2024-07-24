module UsersHelper
    def format_user_name(user)
        "User: #{user.name}"
    end
    def user_greeting(user)
        "Hello, #{user.name}!"
    end
end
