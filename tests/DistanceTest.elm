module DistanceTest exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)
import Time
import Time.Distance exposing (..)


posix =
    Time.millisToPosix


now =
    1530403200000


second =
    1000


minute =
    second * 60


hour =
    minute * 60


day =
    hour * 24


month =
    day * 30


year =
    day * 365


plusSeconds seconds time =
    time + (seconds * second)


lessSeconds seconds time =
    time - (seconds * second)


plusMinutes minutes time =
    time + (minutes * minute)


plusHours hours time =
    time + (hours * hour)


plusDays days time =
    time + (days * day)


plusMonths months time =
    time + (months * month)


plusYears years time =
    time + (years * year)


inWordsTest testCase time1 time2 expected =
    test testCase <|
        \_ ->
            Expect.equal
                expected
                (inWords time1 time2)


suite : Test
suite =
    describe "Time.Distance"
        [ inWordsTest
            "5 seconds"
            (posix now)
            (now |> plusSeconds 5 |> posix)
            "less than 5 seconds"
        , inWordsTest
            "10 seconds"
            (posix now)
            (now |> plusSeconds 10 |> posix)
            "less than 10 seconds"
        , inWordsTest
            "- 10 seconds"
            (posix now)
            (now |> plusSeconds 10 |> posix)
            "less than 10 seconds"
        , inWordsTest
            "20 seconds"
            (posix now)
            (now |> plusSeconds 20 |> posix)
            "less than 20 seconds"
        , inWordsTest
            "25 seconds"
            (posix now)
            (now |> plusSeconds 25 |> posix)
            "half a minute"
        , inWordsTest
            "- 25 seconds"
            (posix now)
            (now |> lessSeconds 25 |> posix)
            "half a minute"
        , inWordsTest
            "minute"
            (posix now)
            (now |> plusSeconds 45 |> posix)
            "less than a minute"
        , inWordsTest
            "- minute"
            (posix now)
            (now |> lessSeconds 45 |> posix)
            "less than a minute"
        , inWordsTest
            "1 minute"
            (posix now)
            (now |> plusSeconds 60 |> posix)
            "1 minute"
        , inWordsTest
            "1 minute 30 seconds"
            (posix now)
            (now |> plusSeconds 90 |> posix)
            "1 minute"
        , inWordsTest
            "2 minutes"
            (posix now)
            (now |> plusSeconds 120 |> posix)
            "2 minutes"
        , inWordsTest
            "3 minutes"
            (posix now)
            (now |> plusSeconds 180 |> posix)
            "3 minutes"
        , inWordsTest
            "1 hour"
            (posix now)
            (now |> plusMinutes 60 |> posix)
            "about 1 hour"
        , inWordsTest
            "1:30"
            (posix now)
            (now |> plusMinutes 90 |> posix)
            "about 1 hour"
        , inWordsTest
            "1:45"
            (posix now)
            (now |> plusMinutes 105 |> posix)
            "about 2 hours"
        , inWordsTest
            "3 hours"
            (posix now)
            (now |> plusMinutes 180 |> posix)
            "about 3 hours"
        , inWordsTest
            "23 hours"
            (posix now)
            (now |> plusHours 23 |> posix)
            "about 23 hours"
        , inWordsTest
            "1 day"
            (posix now)
            (now |> plusHours 24 |> posix)
            "1 day"
        , inWordsTest
            "1.5 days"
            (posix now)
            (now |> plusHours 36 |> posix)
            "1 day"
        , inWordsTest
            "1.75 days"
            (posix now)
            (now |> plusHours 40 |> posix)
            "1 day"
        , inWordsTest
            "> 1.75 days"
            (posix now)
            (now |> plusHours 41 |> posix)
            "2 days"
        , inWordsTest
            "2 days"
            (posix now)
            (now |> plusHours 48 |> posix)
            "2 days"
        , inWordsTest
            "1 month"
            (posix now)
            (now |> plusDays 30 |> posix)
            "about 1 month"
        , inWordsTest
            "45 days"
            (posix now)
            (now |> plusDays 45 |> posix)
            "about 1 month"
        , inWordsTest
            "60 days"
            (posix now)
            (now |> plusDays 60 |> posix)
            "about 2 months"
        , inWordsTest
            "11 months"
            (posix now)
            (now |> plusMonths 11 |> posix)
            "about 11 months"
        , inWordsTest
            "1 year"
            (posix now)
            (now |> plusMonths 12 |> posix)
            "about 1 year"
        , inWordsTest
            "13 months"
            (posix now)
            (now |> plusMonths 13 |> posix)
            "about 1 year"
        , inWordsTest
            "18 months"
            (posix now)
            (now |> plusYears 1 |> plusMonths 6 |> posix)
            "about 1 year"
        , inWordsTest
            "almost 2 years"
            (posix now)
            (now |> plusYears 1 |> plusMonths 9 |> posix)
            "almost 2 years"
        , inWordsTest
            "about 2 years"
            (posix now)
            (now |> plusYears 2 |> posix)
            "about 2 years"
        , inWordsTest
            "over 2 years"
            (posix now)
            (now |> plusYears 2 |> plusMonths 4 |> posix)
            "over 2 years"
        , inWordsTest
            "almost 3 years"
            (posix now)
            (now |> plusYears 2 |> plusMonths 9 |> posix)
            "almost 3 years"
        , inWordsTest
            "about 3 years"
            (posix now)
            (now |> plusYears 3 |> posix)
            "about 3 years"
        , inWordsTest
            "over 3 years"
            (posix now)
            (now |> plusYears 3 |> plusMonths 4 |> posix)
            "over 3 years"
        , inWordsTest
            "0 seconds"
            (posix now)
            (posix now)
            "0 seconds"
        ]
