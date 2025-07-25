#set page(margin: 4pt, width: auto, height: auto)
#import "../../src/lib.typ"

#lib.canvas({
    import lib: *

    resistor("r1", (0,0), (3,0))
    resistor("r2", "r1.in", (rel: (0,3)))
    resistor("r3", "r2.out", (rel: (3,0)))
    resistor("r4", "r3.out", "r1.out")
})
