# Time distance

Return the distance between two times in words.

e.g.

- `less than 5 seconds`
- `about 1 month`
- `over 5 year`

This use the <https://package.elm-lang.org/packages/elm/time/latest/> package.

## Installation

```
elm install sporto/time-distance
```

## Usage

```
import Time
import Time.Distance as Distance

time1 = Time.fromMillis 1530403200000
time2 = Time.fromMillis 1530403205000

Distance.inWords time1 time2 == "less than 5 seconds"
```

More examples in the /test folder.

Heavily inspired by <https://github.com/alpacaaa/elm-date-distance>