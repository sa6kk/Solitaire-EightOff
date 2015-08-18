package Games.EightOff 
{
	import flash.display.Sprite;
	import flash.geom.* ;
	import Games.EightOff.*;

	/**
	 * ...
	 * @author Kolarov
	 */
	public class EightOff extends Sprite
	{
		private var deck:Deck = new Deck();
		
		private var extraPiles:Array = [];//8
		private var fieldPiles:Array = [];//8
		private var sidePiles:Array = [];//4
		
		private var suits:Array = ["D", "H", "C", "S"];
		
		private const StartPointExtraPiles:Point = new Point(30, 20);
		private const StartPointFieldPiles:Point = new Point(30, 150);
		private const StartPointSidePiles:Point = new Point(680, 20);
		private const CARD_WIDTH:int = 65;
		private const CARD_HEIGHT:int = 100;
		
		private var gameEngine:Engine;
		
		public function EightOff() 
		{
			loadPiles();
			gameEngine = new Engine(this as Sprite, this.extraPiles, this.fieldPiles, this.sidePiles, this.deck);	
		}
		
		private function loadPiles():void {
			loadExtraPiles();
			loadFieldPiles();
			loadSidePiles();
		}
		
		private function loadExtraPiles():void {
			var interval:int = 10;
			for (var extraPileIndex:int = 0; extraPileIndex < 8; extraPileIndex++) {
				var extraPile:ExtraPile = new ExtraPile();
				this.extraPiles.push(extraPile);
				this.addChild(extraPile);
				extraPile.x = this.StartPointExtraPiles.x + (interval + this.CARD_WIDTH) * extraPileIndex;
				extraPile.y = this.StartPointExtraPiles.y;
			}	
		}
		
		private function loadFieldPiles():void {
			var interval:int = 10;
			for (var fieldPileIndex:int = 0; fieldPileIndex < 8; fieldPileIndex++) {
				var fieldPile:FieldPile = new FieldPile();
				this.fieldPiles.push(fieldPile);
				this.addChild(fieldPile);
				fieldPile.x = this.StartPointFieldPiles.x + (interval + this.CARD_WIDTH) * fieldPileIndex;
				fieldPile.y = this.StartPointFieldPiles.y;
			}	
		}
		
		private function loadSidePiles():void {
			var interval:int = 10;
			for (var sidePileIndex:int = 0; sidePileIndex < 4; sidePileIndex++) {
				var currentSuit:String = this.suits[sidePileIndex];
				var sidePile:SidePile = new SidePile(currentSuit);
				this.sidePiles.push(sidePile);
				this.addChild(sidePile);
				sidePile.x = this.StartPointSidePiles.x;
				sidePile.y = this.StartPointSidePiles.y + (interval + this.CARD_HEIGHT) * sidePileIndex;
			}	
		}
		
	}

}