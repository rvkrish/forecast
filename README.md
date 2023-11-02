**Requirements:**

- Must be done in Ruby on Rails
- Accept an address as input
- Retrieve forecast data for the given address. This should include, at minimum, the
- current temperature (Bonus points - Retrieve high/low and/or extended forecast)
- Display the requested forecast details to the user
- Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
- Display indicator if the result is pulled from the cache.

**The Assumptions I made:**

- We can fetch the data from 3rd party services but must provide respective API keys. For convenience, I used the local database to store the temperature-related information.
- Zip code as a separate field in the address.
- Address as a single field.

**Installation and starting the server:**

- Download the source code.
- Run the **bundle install** command.
- Install redis serve.
- Start redis server
- Start the rails server.

Screenshot to feed the data.

Below is the screenshot where I entered the weather information

<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/Form%20to%20enter%20data.png' width='250'>

Screenshot of the index page.

<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/index.png' width='500'>

When data not completely fed.<br />
<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/emptydata.png' width='500'>

When the known address is given.<br />
<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/data_in_db.png' width='500'>

When an unknown address with a cached zip code is given.<br />
<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/cached_with_zipcode.png' width='500'>

When an unknown address is given.<br />
<img src='https://github.com/rvkrish/forecast/blob/7c5e463eee2cf06ce8f1870e3553a40ba3ebd766/public/screenshots/incase%20data%20is%20not%20present.png' width='500'>

**What I have written in the code:**

- Actual code to realize the logic.
- Used Redis server to cache data with 30 minutes of expiry. 
- Minimum UI validations.
- bootstrap CDN(Just for minimum look)
- Supporting scaffold for entering weather information and address.
- Specs(Unit test cases) for both controller and model tried to cover most cases.
- Comments for logic and specs which I have written.

**What can be improved:**

- We can add a coverage report.
- flash messages and notices.
- We can include integration test cases.
- Can add some more edge cases.




