# Our Simple Architecture 
    This software was implemented to solve a very specific problem, return the tweets and status from two
     different urls. Both urls could return a json file if it works, otherwise it would give an error. 

    To solve this problem, I used Sinatra, because the client wanted to see data online. I didn't use Rails
     because the problem were very simple and it didn't require the whole Rails achiteture.

    So I created two classes one for Sinatra server, Server class, and one for request data from the external
     server, RequestDataService class. 

    The Server class is responsible for serving two urls: http://localhost:3000/ and http://localhost:3000/
    test_request. The first url return the data required in this problem and the second one is used to test if 
    the RequestDataService class is working correctly.

    The RequestDataService  has a constructor and a method request_data. The constructor receive 2 parameters, 
    the first one is the url and the second one is the number of times that the class will try to reach the 
    url. The request_data method uses the url to get the data and try to parser the response. If the url have 
    some error or the response is not a valid json, than it will try until the number of times specified on 
    the constructor.

# Another more robust Solution
    This simple achiteture must solve the problem for a while. Another more robust architeture could be built 
    using Rails, Sideqik and docker to integrate than. Maybe we could also use Redis if the external server 
    take too long answer response.  

# Intial Setup
    To setup the project, please run: 
        bundle install 

# Run the web server
    To start the server, please run:
        bundle exec rackup -p 3000
    After the server is running it is possible to use a browser or the command curl to access it at the url http://localhost:3000/ 

# Run the tests
    To run the tests, pelase make sure that the server is runing:
        bundle exec rackup -p 3000
    Then run the comand
        rspec request_data_service_spec.rb