Feature:
  As a app
  I want to access the feed
  So that I can use it

  @wip
  Scenario: Make sure api infrastructure work
    Given database has one feed
      | type    | weibo      |
      | content | test weibo |
    When I visit the api
    Then I can get the feed
