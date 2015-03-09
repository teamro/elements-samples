using java.util;
using android.app;
using android.content;
using android.os;
using android.util;
using android.view;
using android.widget;

namespace org.me.torch
{
	public class TorchActivity : Activity
	{
    public const int SWITCH_OFF_TORCH_ID = 1;
    PowerManager mPowerManager;
    PowerManager.WakeLock mWakeLock;
		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);
	    
		  var mainLayout = new LinearLayout(this);
      mainLayout.LayoutParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.FILL_PARENT, ViewGroup.LayoutParams.FILL_PARENT);	  
      //The torch is white
      mainLayout.BackgroundColor = (Int64) 0xFFFFFFFF;
      //Hide the regular activity title
      requestWindowFeature(Window.FEATURE_NO_TITLE);
      //Hide the OS status bar
      Window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
      //ensure this activity has full brightness
      Window.Attributes.screenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_FULL;
      // Get an instance of the PowerManager
      mPowerManager = (PowerManager)SystemService[POWER_SERVICE];
      // Create a bright wake lock. Requires WAKE_LOCK permission - see Android manifest file
      mWakeLock = mPowerManager.newWakeLock(PowerManager.SCREEN_BRIGHT_WAKE_LOCK, @Class.Name);
      //Show the view
      ContentView = mainLayout;
      registerForContextMenu(mainLayout);
		}
    public override void onResume()
    {
      base.onResume();
      // Acquire wake lock to keep screen on
      mWakeLock.acquire();
    }
    public override void onPause()
    {
      base.onPause();
      // Release wake lock to allow screen to turn off, as per normal
      mWakeLock.release();
    }

    public override bool onCreateOptionsMenu(Menu menu)
    {
      var item = menu.add(0, SWITCH_OFF_TORCH_ID, 0, R.@string.torchMenuItem_Text);
      //Options menu items support icons
      item.Icon = android.R.drawable.ic_menu_close_clear_cancel;
      return true;
    }

    public override void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo)
    {
      base.onCreateContextMenu(menu, v, menuInfo);
      menu.add(0, SWITCH_OFF_TORCH_ID, 0, R.@string.torchMenuItem_Text);
    }

    public bool MenuItemSelected(MenuItem item)
    {
      if (item.ItemId == SWITCH_OFF_TORCH_ID)
      {
        finish();
        return true;
      }
      return false;
    }

    public override bool onContextItemSelected(MenuItem item)
    {
      return MenuItemSelected(item);
    }

    public override bool onOptionsItemSelected(MenuItem item)
    {
      return MenuItemSelected(item);
    }

	}
}
