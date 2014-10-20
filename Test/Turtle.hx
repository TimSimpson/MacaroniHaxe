// ARGH! So close...
// If I could just place the cpp part above where it includes the header
// this would work:
// @:cppFileCode("#define MACARONI_LIB_CREATE_Lp3___MacaroniHaxe___DEV___lib")

@:headerCode("#include <HaxeConfig.hpp>")
class Turtle
{
    private var name: String;
    private var spots: Int;

    public function new(name: String, spots: Int) {
        this.name = name;
        this.spots = spots;
    }

    public function getName() : String {
        return this.name;
    }

    static function main() {
        trace("Hello World !");
        var t = new Turtle("Timmy", 4);
        trace(t.getName());
    }

    public function getSpots() : Int {
        return this.spots;
    }
}
