package hxaroma;

@:native("nacl")
extern class NaCl {
    @:luaDotMethod public static function prefetch(resource_table: Dynamic): Void;
    @:luaDotMethod public static function track_event(category: String, action: String, label: String, ?value: Dynamic, ?interactive: Bool): Void;
}
