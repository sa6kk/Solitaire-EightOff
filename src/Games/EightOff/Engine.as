package Games.EightOff 
{
	import flash.display.Sprite;
	import Games.GrandFather.Assistant;
	import flash.events.MouseEvent;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author Kolarov
	 */
	public class Engine 
	{
		private var general:Sprite;
		private var extraPiles:Array = [];//8
		private var fieldPiles:Array = [];//8
		private var sidePiles:Array = [];//4
		private var tempPile:TempCardsPile = new TempCardsPile();
		
		private var deck:Deck;
		private var dealing:Dealing;
		
		private var pressedExtraPile:ExtraPile;
		private var pressedFieldPile:FieldPile;
		private var takenCard:Card;
		private var takenCards:Array;
		
		public function Engine(generalPar:Sprite, extraPilesPar:Array,fieldPilesPar:Array,sidePilesPar:Array,deckPar:Deck) 
		{
			initFields(generalPar,extraPilesPar,fieldPilesPar,sidePilesPar,deckPar);
			dealing.initialDealing();
			makeInteraction();
		}
		/////////////////////////////////////////// INTERACTION
		private function makeInteraction():void {
			makeExtraPilesInteractive();
			//makeFieldPilesInteractive();
		}
		
		// EXTRA PILES INTERACTION
		private function makeExtraPilesInteractive():void {
			for (var extraPileIndex:int = 0; extraPileIndex < this.extraPiles.length; extraPileIndex++ ) {
			var extraPile:ExtraPile = this.extraPiles[extraPileIndex];
				Assistant.addEventListenerTo(extraPile, MouseEvent.MOUSE_DOWN, dragCardFromExtraPile);
			}
		}
		
		private function dragCardFromExtraPile(e:MouseEvent):void {
			this.pressedExtraPile = e.currentTarget as ExtraPile;
			this.takenCard = this.pressedExtraPile.giveCard();
			invokeTempPileToMouse();
			this.tempPile.pushCard(takenCard);
			this.tempPile.startDrag();
		}
		
		// FIELD PILES INTERACTION
		private function makeFieldPilesInteractive():void {
			
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function initFields(generalPar:Sprite, extraPilesPar:Array,fieldPilesPar:Array,sidePilesPar:Array,deckPar:Deck):void {
			this.general = generalPar;
			this.extraPiles = extraPilesPar;
			this.fieldPiles = fieldPilesPar;
			this.sidePiles = sidePilesPar;
			this.deck = deckPar;
			this.dealing = new Dealing(this.deck, this.fieldPiles, this.extraPiles);
		}
		
		private function invokeTempPileToMouse():void {
			this.general.addChild(tempPile);
			this.tempPile.x = general.mouseX;
			this.tempPile.y = general.mouseY;
		}
		
		private function removeTempPile():void {
			this.general.removeChild(tempPile);	
		}
		
	}

}