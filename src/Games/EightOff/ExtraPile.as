package Games.EightOff 
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author Kolarov
	 */
	public class ExtraPile extends Sprite
	{
		private var card:Array = [];
		
		private const CARD_WIDTH:int = 65;
		private const CARD_HEIGHT:int = 100;
		
		public function ExtraPile() 
		{
			//todo: drawBorder();
			drawBorder();
		}
		
		private function drawBorder():void {
			var line:Shape = new Shape();
			line.graphics.lineStyle(1, 0x0);
			line.graphics.moveTo(0, 0);
			line.graphics.lineTo(CARD_WIDTH, 0);
			line.graphics.lineTo(CARD_WIDTH, CARD_HEIGHT);
			line.graphics.lineTo(0, CARD_HEIGHT);
			line.graphics.lineTo(0, 0);
			this.addChild(line);
		}
		
		public function pushCard(card:Card):void {
			this.card.push(card);
			this.addChild(card);
		}
		
		public function giveCard():Card {
			var cardForGive:Card = card[0];
			this.removeChild(cardForGive);
			this.card.pop();
			return cardForGive;
		}
		
	}

}