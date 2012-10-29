module PagesHelper
    require 'net/http'
    require 'set'

    def working_url?(url)
        begin
            request = Net::HTTP.get_response(URI.parse(url)) # returns an Net::HTTPResponse Object
            request.code.to_f < 400
        rescue
            false
        end
    end
end
