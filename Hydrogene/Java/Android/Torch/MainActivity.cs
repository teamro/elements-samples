//Sample app by Brian Long (http://blong.com)

/*
  This example demonstrates a number of things:
  - how to invoke a confirmation dialog
  - how to make a 'toast' message
  - how to launch another activity
  - how to make a full screen activity (no status bar)
  - how to remove the activity title bar
  - how to use a wake lock to prevent the screen from sleeping
  - how to set up an options menu (one that shows when you press the Menu button)
  - how to set up a context menu (one that shows after a long press)
*/

using java.util;
using android.app;
using android.content;
using android.os;
using android.util;
using android.view;
using android.widget;

namespace org.me.torch
{
	public class MainActivity: Activity
	{
    private const int CONFIRM_TORCH_DIALOG = 1;    

		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			ContentView = R.layout.main;
      // Get our button from the layout resource,
      // and attach an event to it
      var torchButton = findViewById(R.id.torchButton) as Button;
      //torchButton.OnClickListener := method begin ShowDialog(CONFIRM_TORCH_DIALOG); end;
      torchButton.OnClickListener = delegate(View v){showDialog(CONFIRM_TORCH_DIALOG);};        
		}

    public override Dialog onCreateDialog(int id)
    {
      if (id == CONFIRM_TORCH_DIALOG)
      {
        //Create dialog here and return it
        //Note this is called just once regardless of number of invocations, unless you call RemoveDialog()
        var builder = new AlertDialog.Builder(this);
        builder.Message = R.@string.torchDialog_Message;      
        builder.setPositiveButton(android.R.@string.yes, TorchDialog_YesClickedEvent);
        builder.setNegativeButton(android.R.@string.no, delegate(DialogInterface dialog, int which){dialog.cancel();});      
        return builder.create();
      }
      return base.onCreateDialog(id);
    }
    public void TorchDialog_YesClickedEvent(DialogInterface dialog, int which)
    {
      //Brief popup message aka toast
      Toast.makeText(this, R.@string.torchButton_Toast, Toast.LENGTH_SHORT).show();
      //Now show the torch screen  
      var i = new Intent(this, typeOf(TorchActivity));
      startActivity(i);
    }
	}
}
