package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/Back.png", __ASSET__img_back_png);
		type.set ("img/Back.png", AssetType.IMAGE);
		className.set ("img/Background.png", __ASSET__img_background_png);
		type.set ("img/Background.png", AssetType.IMAGE);
		className.set ("img/bottombutton.png", __ASSET__img_bottombutton_png);
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		className.set ("img/bottombuttonhover.png", __ASSET__img_bottombuttonhover_png);
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		className.set ("img/Button.png", __ASSET__img_button_png);
		type.set ("img/Button.png", AssetType.IMAGE);
		className.set ("img/ButtonHover.png", __ASSET__img_buttonhover_png);
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		className.set ("img/Front.png", __ASSET__img_front_png);
		type.set ("img/Front.png", AssetType.IMAGE);
		className.set ("img/Left Back.png", __ASSET__img_left_back_png);
		type.set ("img/Left Back.png", AssetType.IMAGE);
		className.set ("img/left Front.png", __ASSET__img_left_front_png);
		type.set ("img/left Front.png", AssetType.IMAGE);
		className.set ("img/middlebutton.png", __ASSET__img_middlebutton_png);
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		className.set ("img/middlebuttonhover.png", __ASSET__img_middlebuttonhover_png);
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		className.set ("img/Right Back.png", __ASSET__img_right_back_png);
		type.set ("img/Right Back.png", AssetType.IMAGE);
		className.set ("img/Right Front.png", __ASSET__img_right_front_png);
		type.set ("img/Right Front.png", AssetType.IMAGE);
		className.set ("img/Side Left.png", __ASSET__img_side_left_png);
		type.set ("img/Side Left.png", AssetType.IMAGE);
		className.set ("img/Side Right.png", __ASSET__img_side_right_png);
		type.set ("img/Side Right.png", AssetType.IMAGE);
		className.set ("img/tom_tilesheet.png", __ASSET__img_tom_tilesheet_png);
		type.set ("img/tom_tilesheet.png", AssetType.IMAGE);
		className.set ("img/topbutton.png", __ASSET__img_topbutton_png);
		type.set ("img/topbutton.png", AssetType.IMAGE);
		className.set ("img/topbuttonhover.png", __ASSET__img_topbuttonhover_png);
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "img/Back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/bottombutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/bottombuttonhover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ButtonHover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Front.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Left Back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/left Front.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/middlebutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/middlebuttonhover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Right Back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Right Front.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Side Left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Side Right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/tom_tilesheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/topbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/topbuttonhover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/Back.png", __ASSET__img_back_png);
		type.set ("img/Back.png", AssetType.IMAGE);
		
		className.set ("img/Background.png", __ASSET__img_background_png);
		type.set ("img/Background.png", AssetType.IMAGE);
		
		className.set ("img/bottombutton.png", __ASSET__img_bottombutton_png);
		type.set ("img/bottombutton.png", AssetType.IMAGE);
		
		className.set ("img/bottombuttonhover.png", __ASSET__img_bottombuttonhover_png);
		type.set ("img/bottombuttonhover.png", AssetType.IMAGE);
		
		className.set ("img/Button.png", __ASSET__img_button_png);
		type.set ("img/Button.png", AssetType.IMAGE);
		
		className.set ("img/ButtonHover.png", __ASSET__img_buttonhover_png);
		type.set ("img/ButtonHover.png", AssetType.IMAGE);
		
		className.set ("img/Front.png", __ASSET__img_front_png);
		type.set ("img/Front.png", AssetType.IMAGE);
		
		className.set ("img/Left Back.png", __ASSET__img_left_back_png);
		type.set ("img/Left Back.png", AssetType.IMAGE);
		
		className.set ("img/left Front.png", __ASSET__img_left_front_png);
		type.set ("img/left Front.png", AssetType.IMAGE);
		
		className.set ("img/middlebutton.png", __ASSET__img_middlebutton_png);
		type.set ("img/middlebutton.png", AssetType.IMAGE);
		
		className.set ("img/middlebuttonhover.png", __ASSET__img_middlebuttonhover_png);
		type.set ("img/middlebuttonhover.png", AssetType.IMAGE);
		
		className.set ("img/Right Back.png", __ASSET__img_right_back_png);
		type.set ("img/Right Back.png", AssetType.IMAGE);
		
		className.set ("img/Right Front.png", __ASSET__img_right_front_png);
		type.set ("img/Right Front.png", AssetType.IMAGE);
		
		className.set ("img/Side Left.png", __ASSET__img_side_left_png);
		type.set ("img/Side Left.png", AssetType.IMAGE);
		
		className.set ("img/Side Right.png", __ASSET__img_side_right_png);
		type.set ("img/Side Right.png", AssetType.IMAGE);
		
		className.set ("img/tom_tilesheet.png", __ASSET__img_tom_tilesheet_png);
		type.set ("img/tom_tilesheet.png", AssetType.IMAGE);
		
		className.set ("img/topbutton.png", __ASSET__img_topbutton_png);
		type.set ("img/topbutton.png", AssetType.IMAGE);
		
		className.set ("img/topbuttonhover.png", __ASSET__img_topbuttonhover_png);
		type.set ("img/topbuttonhover.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bottombutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bottombuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_buttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_left_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_left_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_middlebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_middlebuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_right_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_right_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_side_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_side_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_tom_tilesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_topbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_topbuttonhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5





















#else



#if (windows || mac || linux)


@:image("assets/img/Back.png") #if display private #end class __ASSET__img_back_png extends lime.graphics.Image {}
@:image("assets/img/Background.png") #if display private #end class __ASSET__img_background_png extends lime.graphics.Image {}
@:image("assets/img/bottombutton.png") #if display private #end class __ASSET__img_bottombutton_png extends lime.graphics.Image {}
@:image("assets/img/bottombuttonhover.png") #if display private #end class __ASSET__img_bottombuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Button.png") #if display private #end class __ASSET__img_button_png extends lime.graphics.Image {}
@:image("assets/img/ButtonHover.png") #if display private #end class __ASSET__img_buttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Front.png") #if display private #end class __ASSET__img_front_png extends lime.graphics.Image {}
@:image("assets/img/Left Back.png") #if display private #end class __ASSET__img_left_back_png extends lime.graphics.Image {}
@:image("assets/img/left Front.png") #if display private #end class __ASSET__img_left_front_png extends lime.graphics.Image {}
@:image("assets/img/middlebutton.png") #if display private #end class __ASSET__img_middlebutton_png extends lime.graphics.Image {}
@:image("assets/img/middlebuttonhover.png") #if display private #end class __ASSET__img_middlebuttonhover_png extends lime.graphics.Image {}
@:image("assets/img/Right Back.png") #if display private #end class __ASSET__img_right_back_png extends lime.graphics.Image {}
@:image("assets/img/Right Front.png") #if display private #end class __ASSET__img_right_front_png extends lime.graphics.Image {}
@:image("assets/img/Side Left.png") #if display private #end class __ASSET__img_side_left_png extends lime.graphics.Image {}
@:image("assets/img/Side Right.png") #if display private #end class __ASSET__img_side_right_png extends lime.graphics.Image {}
@:image("assets/img/tom_tilesheet.png") #if display private #end class __ASSET__img_tom_tilesheet_png extends lime.graphics.Image {}
@:image("assets/img/topbutton.png") #if display private #end class __ASSET__img_topbutton_png extends lime.graphics.Image {}
@:image("assets/img/topbuttonhover.png") #if display private #end class __ASSET__img_topbuttonhover_png extends lime.graphics.Image {}



#end

#if openfl

#end

#end
#end

