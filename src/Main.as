package
{
	import flash.display.Sprite;
	import Games.EightOff.EightOff;
	import MainMenu;
	
	/**
	 * ...
	 * @author SS
	 */
	
	public class Main extends Sprite 
	{	
		public function Main() 
		{		
			var game:Games.EightOff.EightOff = new Games.EightOff.EightOff();
			addChild(game);
		}
	}
}