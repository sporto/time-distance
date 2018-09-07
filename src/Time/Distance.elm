module Time.Distance exposing (inWords)

import Time exposing (Posix)

{-|
# Time.Distance
@docs inWords
-}

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


toS =
    String.fromInt

{-| Returns the distance between two times in words.

    time1 = Posix.fromMillis 1530403200000
    time2 = Posix.fromMillis 1530403205000
    inWords time1 time2 == "less than 5 seconds"

Month calculations are approximates, using 30 days.
-}
inWords : Posix -> Posix -> String
inWords posix1 posix2 =
    let
        time1 =
            Time.posixToMillis posix1

        time2 =
            Time.posixToMillis posix2

        diff =
            time1 - time2

        absDiff =
            abs diff

        diffInSeconds =
            absDiff // second

        diffInMinutes =
            absDiff // minute

        diffInHours =
            absDiff // hour

        diffInDays =
            absDiff // day

        diffInMonths =
            absDiff // month

        diffInYear =
            absDiff // year

        diffInYearFloat =
            toFloat absDiff / year
    in
    if diffInSeconds < 25 then
        "less than " ++ toS diffInSeconds ++ " seconds"

    else if diffInSeconds < 35 then
        "half a minute"

    else if diffInSeconds < 60 then
        "less than a minute"

    else if diffInSeconds < 120 then
        "1 minute"

    else if diffInMinutes < 60 then
        toS diffInMinutes ++ " minutes"

    else if diffInMinutes < 91 then
        "about 1 hour"

    else if diffInMinutes < 120 then
        "about 2 hours"

    else if diffInHours < 24 then
        "about " ++ toS diffInHours ++ " hours"

    else if diffInHours < 40 then
        "1 day"

    else if diffInDays < 30 then
        toS diffInDays ++ " days"

    else if diffInDays < 60 then
        "about 1 month"

    else if diffInMonths < 12 then
        "about " ++ toS diffInMonths ++ " months"

    else if diffInMonths < 21 then
        "about 1 year"

    else
        let
            sinceStartOfYear =
                remainderBy year absDiff 

            monthsSinceStartOfYear =
                sinceStartOfYear // month
        in
        if monthsSinceStartOfYear < 3 then
            "about " ++ toS diffInYear ++ " years"

        else if monthsSinceStartOfYear < 9 then
            "over " ++ toS diffInYear ++ " years"

        else
            "almost " ++ toS (diffInYear + 1) ++ " years"
