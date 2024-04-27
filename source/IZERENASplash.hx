package;

import openfl.text.TextFormat;

import flixel.system.FlxSplash;

import flixel.FlxSprite;

class IZERENASplash extends FlxSplash
{
    private var _izerena:FlxSprite;

    override public function create():Void
    {
		// dtf = new TextFormat(Paths.font('one.ttf'), 16, 0xffffff);
        _text.text = "IZERENA Engine";
    }

    override public function destroy():Void
    {
        _izerena = null;
    }

    override function timerCallback(Timer:FlxTimer):Void
    {
		_text.text = "IZERENA Engine";

		if (_curPart == 5)
		{
			FlxTween.tween(_izerena, {alpha: 0}, 3.0, {ease: FlxEase.quadOut});
		}
    }

    override function onResize(Width:Int, Height:Int):Void
    {
        _izerena.x = (Width / 2);
        _izerena.y = (Height / 2) - 20 * FlxG.game.scaleY;

        _izerena.scale.x = _text.scaleX = FlxG.game.scaleX;
		_izerena.scale.y = _text.scaleY = FlxG.game.scaleY;
    }

    override function drawLightBlue():Void
    {
        _izerena = new FlxSprite().loadGraphic(Paths.image('izerena_daihonn'));
        _izerena.updateHitbox();
        _izerena.antialiasing = ClientPrefs.data.antialiasing;
        _izerena.screenCenter(XY);
        add(_izerena);
    }
}