package k.anim;

import js.JQuery;
import js.SWFObject;

@:keep @:expose
class JS {
	static function main():Void {
		
	}

	static function loadAnim(?d:Dynamic):Bool {
		var fw:String = new JQuery("#fwidth").val();
		var fh:String = new JQuery("#fheight").val();
		var so:SWFObject = new SWFObject("/anim.swf","anim",Std.parseInt(fw),Std.parseInt(fh),"2","#DBDEE3");
		so.addParam("AllowScriptAccess","always");
		so.addVariable("svgpath", new JQuery("#svgpath").val());
		so.addVariable("file", new JQuery("#filename").val());
		so.addVariable("fw", fw);
		so.addVariable("fh", fh);
		so.addVariable("fps", new JQuery("#fps").val());
		so.addVariable("mirror", new JQuery("#mirror").prop("checked") ? "1" : "0");
		so.addParam("menu","true");
		so.addParam("scale","noScale");
		so.write("anim_swf");
		return false;
	}
}