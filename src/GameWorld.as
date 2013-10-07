package  {
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author reustonium
	 */
	public class GameWorld extends World{
		public var bg:Backdrop;
		public var bg1:Backdrop;
		public var player:Player;
		
		public function GameWorld() {
			bg = new Backdrop(Assets.BG, true, false);
			bg1 = new Backdrop(Assets.BG1, true, false);
			bg1.scrollX = 0.5;
			
			addGraphic(bg);
			addGraphic(bg1);
			
			player = new Player();
			player.x = 100;
			player.y = FP.height - 150;
			add(player);
		}
		
		override public function update():void {
			super.update();
			
			FP.camera.x = player.x - 150;
		}
		
	}

}