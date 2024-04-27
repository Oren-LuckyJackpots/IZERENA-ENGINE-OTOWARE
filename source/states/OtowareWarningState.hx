package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;

import flixel.system.FlxSplash;

import openfl.display.Sprite;
import states.TitleState;

class OtowareWarningState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"このゲームには過度の'音割れ'要素が含まれています！\n\nそれでも続行しますか？",
			32);
		warnText.setFormat(Paths.font('keifont.ttf'), 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter();
		add(warnText);

		super.create();
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT)
            {
				leftState = true;
				FlxG.sound.play(Paths.sound('hora-man'), 0.6);
				FlxFlicker.flicker(warnText, 4, 0.1, false, true, function(flk:FlxFlicker) {
					new FlxTimer().start(5, function (tmr:FlxTimer) {
						MusicBeatState.switchState(new FlxSplash(new TitleState()));
					});
				});
			}
		}
		super.update(elapsed);
	}
}
