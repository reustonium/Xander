package 
{
	import com.newgrounds.APIConnection;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import com.newgrounds.API;
	import com.newgrounds.APIEvent;

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
			API.addEventListener(APIEvent.API_CONNECTED, onAPIConnected);
			API.connect(root, NG.NGAPI, NG.NGKEY);			
		}
		
		public function onAPIConnected(event:APIEvent):void {
			if(event.success){
				trace("Connected to NG API");
				FP.world = new GameWorld();
				trace(API.username);
			} else {
				trace("NG API Error: " + event.error);
			}
		}
	}
	
}