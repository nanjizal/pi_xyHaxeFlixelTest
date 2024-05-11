package pi_xy._applications;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.graphics.FlxGraphic;
import pi_xy.formats.OpenFLbitmapData;

class Test_pi_xy_Flixel extends openfl.display.Sprite {
    public function new() {
        super();
        addChild(new FlxGame(0, 0, PlayState));
    }
}

class PlayState extends FlxState {
    override public
    function create() {
        super.create();
        var pixelImage = new Pixelimage( 1024, 768 );
        pixelImage.transparent = true;
        pixelImage.simpleRect( 0, 0, pixelImage.width, pixelImage.height, 0xffc9c3c3 );
        pixelImage.transparent = true;
        var Violet      = 0xFF9400D3;
        var Indigo      = 0xFF4b0082;
        var Blue        = 0xFF0000FF;
        var Green       = 0xFF00ff00;
        var Yellow      = 0xFFFFFF00;
        var Orange      = 0xFFFF7F00;
        var Red         = 0xFFFF0000;
        var scale       = 12;
        var pixelTest = new Pixelimage( 80*scale, 80*scale );
        pixelTest.transparent = true;
        var colors = [ Violet, Indigo, Blue, Green, Yellow, Orange, Red ];
        var vertColor = colors[0]; 
        for( x in 0...70*scale ){
            vertColor = colors[ Math.floor( (x/scale) / 10 ) ];
            for( y in 0...768-70-45 ) pixelTest.setARGB( x, y, vertColor );
        }
        pixelTest.gradientShape.triangle( 100, 100, 0xf0ffcf00, 300, 220, 0xf000cfFF, 120, 300, 0xf0cF00FF );
        pixelTest.gradientShape.triangle( 100+120, 100+20, 0xccff0000, 300+120, 220+20, 0xcc0000FF, 120+120, 300+20, 0xcc00ff00 );
        pixelImage.putPixelImage( pixelTest, 45, 45 );
        var bitmapDataTest = OpenFLbitmapData.toOpenflBitmapData_( pixelImage );
        var pixelImageTest = OpenFLbitmapData.fromOpenflBitmapData_( bitmapDataTest );
        var bitmapData = OpenFLbitmapData.toOpenflBitmapData_( pixelImageTest );
        var obj = new FlxSprite( 0, 0, bitmapData );
        add( obj );
    }
    override public
    function update(elapsed:Float){
        super.update(elapsed);
    }
}