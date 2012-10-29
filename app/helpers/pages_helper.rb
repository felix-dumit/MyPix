module PagesHelper
    require 'net/http'
    require 'set'

    def working_url?(url)
        begin
            request = Net::HTTP.get_response(URI.parse(url)) # returns an Net::HTTPResponse Object
            if request.code.to_f < 400
                return true
            else return false
            end
        rescue
            false
        end
    end

    def getName user
        begin
            user.name
        rescue
            "--"
        end
    end

end
