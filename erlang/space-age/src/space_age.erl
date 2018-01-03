-module(space_age).

-export([ageOn/2, test_version/0]).

earth_years(Seconds) -> Seconds / 31557600.

ageOn(mercury, Seconds) -> earth_years(Seconds) / 0.2408467;
ageOn(venus, Seconds) -> earth_years(Seconds) / 0.61519726;
ageOn(earth, Seconds) -> earth_years(Seconds);
ageOn(mars, Seconds) -> earth_years(Seconds) / 1.8808158;
ageOn(jupiter, Seconds) -> earth_years(Seconds) / 11.862615;
ageOn(saturn, Seconds) -> earth_years(Seconds) / 29.447498;
ageOn(uranus, Seconds) -> earth_years(Seconds) / 84.016846;
ageOn(neptune, Seconds) -> earth_years(Seconds) / 164.79132.

test_version() -> 1.
