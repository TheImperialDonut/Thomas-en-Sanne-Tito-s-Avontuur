package ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Ezzz
 */

class Main extends Sprite 
{
	var inited:Bool;
	var menu:MainMenu = new MainMenu ();
	/* ENTRY POINT */
	// testing github
	// still testing github
	
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
		// Ima type stuff here, HI EWOUT
		// Ima type some more shit in here!!!! HIIIIIII
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		trace ("2");
		// (your code here)
		createmenu ();
		
		// Stage
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale;
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	function createmenu()
	{
		addChild(menu);
		trace ("1");
	}
	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
