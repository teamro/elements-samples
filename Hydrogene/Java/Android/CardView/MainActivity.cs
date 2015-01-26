using java.util;
using android.app;
using android.content;
using android.os;
using android.util;
using android.view;
using android.widget;

namespace com.remobjects.cardview
{
	public class MainActivity: Activity
	{
		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			ContentView = R.layout.activity_card_view;

      if (savedInstanceState == null)
      {
        getFragmentManager().beginTransaction().add(R.id.container, CardViewFragment.newInstance()).commit();
      }
		}
	}
}
