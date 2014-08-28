package k.anim;

import haxe.crypto.Md5;

import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.net.URLLoader;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

import format.svg.SVGData;
import format.svg.SVGRenderer;

class Player extends FlxState {
	var sprite:FlxSprite;
	var hash:String;
	var frameid:Int;

	override public function create():Void {
		FlxG.mouse.visible = false;
		bgColor = 0xDBDEE3;
		hash = "";
		sprite = new FlxSprite();
		add(sprite);
		frameid = 0;

		checkSvg();
	}

	override public function update():Void {
		sprite.update();
		frameid = (frameid+1) % 60;
		if (frameid == 42) checkSvg();
	}

	private function checkSvg():Void {
		var request = new URLRequest(Main.svgpath + Main.svgfile + ".svg?v=" + Date.now().getTime());
		request.method = "GET";
		var loader = new URLLoader();
		loader.dataFormat = TEXT;
		loader.addEventListener(flash.events.Event.COMPLETE, function(d:Dynamic) {
			if (hash != Md5.encode(loader.data)) loadSvg(loader.data);
		});
		loader.load(request);
	}

	private function loadSvg(data:String):Void {
		hash = Md5.encode(data);
		var xml:Xml = Xml.parse(data);
		var svgData:SVGData = new SVGData(xml);
		var svgRender:SVGRenderer = new SVGRenderer(svgData);

		var bmp:BitmapData = svgRender.renderBitmap(new Rectangle(0,0,svgRender.width,svgRender.height));
		sprite.loadGraphic(bmp, true, Main.frame_width, Main.frame_height);

		var maxnframes:Int = Std.int( Std.int(svgRender.width/Main.frame_width) * Std.int(svgRender.height/Main.frame_height) );
		// var maxnframes:Int = Std.int(svgRender.width/Main.frame_width); // One-line animations
		var frames:Array<Int> = new Array<Int>();
		for (i in 0...maxnframes) frames.push(i);
		if (Main.mirror) {
			var frames2:Array<Int> = frames.copy();
			frames2.reverse();
			frames = frames.concat(frames2);
		}

		sprite.animation.destroyAnimations();
		sprite.animation.add("loop", frames, Main.fps, true);
		sprite.animation.play("loop");
	}
}