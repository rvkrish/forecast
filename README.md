Requirements:

Must be done in Ruby on Rails
Accept an address as input
Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
Display the requested forecast details to the user
Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if the result is pulled from the cache.

The Assumptions I made:

 We can fetch the data from 3rd party services but must provide respective API keys. For convenience, I used the local database to store the temperature-related information.
Zip code as a separate field in the address.
Address as a single field.

Installation and starting the server:

Download the source code.
Run the bundle install command.
Install redis-serve.
Start redis server
Start the Redis server.

Screenshots to feed the data.

Screenshot of the index page.

When the known address is given

When an unknown address is given.

When an unknown address with a cached zip code is given.


What I have written in the code:

Actual code to realize the logic.
Supporting scaffold for entering weather information and address.
Specs(Unit test cases) for both controller and model tried to cover most cases.
Comments for logic and specs which I have written.

What can be improved:
We can add a coverage report.
We can include integration test cases.
Can add some more edge cases …

 


