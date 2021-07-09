package hxaroma;
import haxe.extern.EitherType;
import js.html.Element;

typedef AromaGameHandlers = {
    var ?loaded: haxe.Constraints.Function;
    var ?std_out: haxe.Constraints.Function;
    var ?std_err: haxe.Constraints.Function;
}

@:native("Aroma")
extern class AromaGame {
    public function new(container: EitherType<String, Element>, width: Int, height: Int, ?event_handlers: AromaGameHandlers);
    public function execute(lua_code: String): Void;
}
