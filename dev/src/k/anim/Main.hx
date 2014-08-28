package k.anim;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

import flixel.FlxGame;
import flixel.FlxState;

using StringTools;

class Main extends Sprite {
	public static var svgpath:String = "http://svg-anims.dev/";
	public static var svgfile:String = "anim";
	public static var frame_width:Int = 32;
	public static var frame_height:Int = 32;
	public static var fps:Int = 60;
	public static var mirror:Bool = false;

	var initialState:Class<FlxState> = Player;
	var zoom:Float = 1;
	var framerate:Int = 60;
	var skipSplash:Bool = false;
	var startFullscreen:Bool = false;

	public static function main():Void {	
		Lib.current.addChild(new Main());
	}

	public function new() {
		super();

		if (Lib.current.stage != null && Std.is(Lib.current.stage.stageWidth, Int)) {
			__complete = true;
			__added = true;
			setupGame();
		} else {
			Lib.current.addEventListener(Event.ADDED_TO_STAGE, _added);
			Lib.current.loaderInfo.addEventListener(Event.COMPLETE, _complete);
		}
	}

	private var __complete:Bool = false;
	private var __added:Bool = false;
	private var __loaded:Bool = false;
	private function _complete(?d:Dynamic) {
		__complete = true;
		setupGame();
	}
	private function _added(?d:Dynamic) {
		__added = true;
		setupGame();
	}

	private function setupGame():Void {
		if (!__complete || !__added || __loaded) return;
		__loaded = true;

		Lib.current.removeEventListener(Event.ADDED_TO_STAGE, _added);
		Lib.current.loaderInfo.removeEventListener(Event.COMPLETE, _complete);

		// Get params
		var params:Dynamic<String> = Lib.current.root.loaderInfo.parameters;
		if (Reflect.hasField(params, "svgpath")) svgpath = params.svgpath;
		if (Reflect.hasField(params, "file")) svgfile = params.file;
		if (Reflect.hasField(params, "fw")) frame_width = Std.parseInt("" + params.fw);
		if (Reflect.hasField(params, "fh")) frame_height = Std.parseInt("" + params.fh);
		if (Reflect.hasField(params, "fps")) fps = Std.parseInt("" + params.fps);
		if (Reflect.hasField(params, "mirror") && params.mirror == "1") mirror = true;

		addChild(new FlxGame(frame_width, frame_height, initialState, zoom, framerate, framerate, skipSplash, startFullscreen));
	}
}