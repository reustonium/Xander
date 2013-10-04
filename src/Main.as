package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author reustonium
	 */
	public class Main extends Engine{
	
		public function Main() {
			super(848, 480, 60, false);
		}
		
		override public function init():void {
			super.init();
			trace("FP Version:" + FP.VERSION + " Started Successfully");
			FP.console.enable();
			
			//TODO: Add Newgrounds Init Code
			
			FP.world = new GameWorld();
		}
	}
	
}