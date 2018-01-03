-module(space_age).

-export([ageOn/2, test_version/0]).

ageOn(Planet, Seconds) ->
  EarthYears = Seconds / 31557600,
  case Planet of
    mercury -> EarthYears / 0.2408467;
    venus -> EarthYears / 0.61519726;
    earth -> EarthYears;
    mars -> EarthYears / 1.8808158;
    jupiter -> EarthYears / 11.862615;
    saturn -> EarthYears / 29.447498;
    uranus -> EarthYears / 84.016846;
    neptune -> EarthYears / 164.79132
  end.

test_version() -> 1.
