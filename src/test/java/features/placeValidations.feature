Feature: Validating place Api

  @AddPlace @Regression
  Scenario Outline: Verify if place is being succesfully added using AddPlace Api
    Given Add place Payload with "<name>" "<langauge>" "<address>"
    When User calls "AddPlaceApi" with "post" http request
    Then The API call got success with status code 200
    And "status" in response body is "OK"
    And "scope" in response body is a "APP"
    And verify the place_id created maps to "<name>" using "getPlaceApi"
    And verify the place_id created map to "<language>" using "getPlaceApi"

    Examples: 
      | name         | langauge | address       |
      | Laxmi Niw    | Marat    | Girija Colony |
   #   | Tulsai Niwas | Marathi  | Shivaji Nagar |

  @DeletePlace @Regression
  Scenario: Verify if Delete Record Function is Working
    Given DeletePlace payload
    When User calls "deletePlaceApi" with "delete" http request
    Then The api call got success with status code 200
    And "status" in response body is "OK"
