package hxaroma;

import haxe.extern.EitherType;

@:enum abstract AromaAudioSourceType(String) {
    var TYPE_STATIC = "static";
    var TYPE_STREAMING = "streaming";
}

@:enum abstract AromaImageWrap(String) {
    var CLAMP = "clamp";
    var REPEAT = "repeat";
}

@:enum abstract AromaImageFilter(String) {
    var LINEAR = "linear";
    var NEAREST = "nearest";
}

@:enum abstract AromaRenderStyle(String) {
    var FILL = "fill";
    var LINE = "line";
}

extern class AromaKeyboard {
    public function new();
    @:luaDotMethod public function isDown(key_name: String): Bool;
}

extern class AromaTimer {
    public function new();
    @:luaDotMethod public function getFPS(): Float;
    @:luaDotMethod public function getTime(): Float;
}

extern class AromaImage {
    public function new();
    @:luaDotMethod public function newImageData(image_url: String): Dynamic;
}

extern class AromaAudio {
    public function new();
    @:luaDotMethod public function newSource(source_url: String, ?source_type: EitherType<String, AromaAudioSourceType>): AromaAudioSource;
}

typedef AromaFont = Dynamic;
typedef AromaShader = Dynamic;

extern class AromaGraphics {
    public function new();
    @:luaDotMethod public function draw(drawable: AromaImageContent, x: Float, y: Float, ?rotate: Float, ?scale_x: Float, ?scale_y: Float, ?origin_x: Float, ?origin_y: Float): Void;
    @:luaDotMethod public function drawq(drawable: AromaImageContent, quad: AromaQuad, x: Float, y: Float, ?rotate: Float, ?scale_x: Float, ?scale_y: Float, ?origin_x: Float, ?origin_y: Float): Void;
    @:luaDotMethod public function print(font: AromaFont, text: String, x: Float, y: Float, ?rotate: Float, ?scale_x: Float, ?scale_y: Float, ?origin_x: Float, ?origin_y: Float): Void;
    @:luaDotMethod public function rectangle(render_style: EitherType<String, AromaRenderStyle>, x: Float, y: Float, width: Float, height: Float): Void;
    @:luaDotMethod public function newFont(font_name: String, ?alphabet: String): AromaFont;
    @:luaDotMethod public function newImage(image_url: String): AromaImageContent;
    @:luaDotMethod public function newImageFont(image: EitherType<AromaImageContent, String>, alphabet: String): AromaFont;
    @:luaDotMethod public function newQuad(x: Float, y: Float, width: Float, height: Float, source_width: Float, source_height: Float): AromaQuad;
    @:luaDotMethod public function newShader(vertex_shader_source: String, fragment_shader_source: String): AromaShader;
    @:luaDotMethod public function pop(): Void;
    @:luaDotMethod public function push(): Void;
    @:luaDotMethod public function rotate(deg: Float): Void;
    @:luaDotMethod public function scale(sx: Float, sy: Float): Void;
    @:luaDotMethod public function translate(tx: Float, ty: Float): Void;
    @:luaDotMethod public function setBackgroundColor(r: Int, g: Int, b: Int, alpha: Int): Void;
    @:luaDotMethod public function getColor(): AromaColor;
    @:luaDotMethod public function setColor(r: Int, g: Int, b: Int, ?alpha: Int): Void;
    @:luaDotMethod public function reset(): Void;
    @:luaDotMethod public function setDefaultShader(shader: AromaShader): Void;
    @:luaDotMethod public function setFont(font: AromaFont): Void;
    @:luaDotMethod public function getFont(): AromaFont;
    @:luaDotMethod public function getHeight(): Int;
    @:luaDotMethod public function setLineWidth(width: Float): Void;
    @:luaDotMethod public function getWidth(): Int;
}

@:multiReturn
extern class AromaColor {
	var red: Int;
	var green: Int;
	var blue: Int;
	var alpha: String;
}

extern class AromaImageContent {
    public function new();
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function setWrap(horiz_wrap: EitherType<String, AromaImageWrap>, vert_wrap: EitherType<String, AromaImageWrap>): Void;
    public function setFilter(min_filter: EitherType<String, AromaImageFilter>, mag_filter: EitherType<String, AromaImageFilter>): Void;
}

extern class AromaQuad {
    public function new();
    public function flip(x: Float, y: Float): Void;
}

extern class AromaAudioSource {
    public function new();
    public function play(): Void;
    public function pause(): Void;
    public function stop(): Void;
    public function setLooping(looping: Bool): Void;
}

@:native("aroma")
extern class Aroma {
    public function new();
    public static var draw: Void->Void;
    public static var focus: Bool->Void;
    public static var keypressed: String->Int->Void;
    public static var keyreleased: String->Int->Void;
    public static var update: Float->Void;

    public static var keyboard: AromaKeyboard;
    public static var timer: AromaTimer;
    public static var image: AromaImage;
    public static var audio: AromaAudio;
    public static var graphics: AromaGraphics;
}
