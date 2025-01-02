;; infinite loop
;; randomly decides up or down
;; randomly scrolling a certain distance
;; sleep random amount of time

;; MsgBox: print

;; alt + r to trigger
!r::
Loop {
    up := 0
    down := 1
    dist_min := 2
    dist_max := 12

    scroll_interval := 25 ;; 25 ms interval
    sleep_min := 1
    sleep_max := 3

    Random, direction, %up%, %down%
    Random, distance, %dist_min%, %dist_max%
    if (direction = 0) {
        loop %distance% {
            Send {WheelUp}
            Sleep, %scroll_interval%
        }
    } else {
        loop %distance% {
            Send {WheelDown}
            Sleep, %scroll_interval%
        }
    }

    Random, sleepTime, %sleep_min%, %sleep_max%
    Sleep, sleepTime * 1000
}

;; alt + shift + r to stop
+!r::
ExitApp