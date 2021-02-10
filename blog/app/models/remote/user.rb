module Remote
  class User
    BASE_URL = ENV['USER_PROFILE_BASE_URL']

    attr_reader :name, :email

    def initialize(name, email)
      @name = name
      @email = email
    end

    class << self
      def find(user_id)
        response = RestClient.get "#{BASE_URL}/users/#{user_id}"
        parsed_response = JSON.parse response
        User.new parsed_response['name'].downcase,
                 parsed_response['email'].downcase
      end
    end
  end
end
