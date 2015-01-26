using java.util;
using android.app;
using android.content;
using android.os;
using android.util;
using android.view;
using android.widget;
using android.support.v7.widget;

namespace com.remobjects.cardview
{
	public class MySeekBar: SeekBar.OnSeekBarChangeListener
	{
		public CardView mCardViewRef;
		public string fString;
		public string TAG;	
		
		public void onStopTrackingTouch(SeekBar arg1)
		{
		}
		public void onStartTrackingTouch(SeekBar arg1)
		{
		}
		public void onProgressChanged(SeekBar arg1, int arg2, bool arg3)
		{
			Log.d(TAG, string.format(fString, arg2));
			//  mCardViewRef.setRadius(arg2);
			mCardViewRef.setElevation(arg2);
		}
	}

   
	public class CardViewFragment : Fragment
	{
		private View fView;
		public CardView mCardView;
		public SeekBar mRadiusSeekBar;
		public SeekBar mElevationSeekBar;

		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);
		}
		
		public override View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
		{
			fView = inflater.inflate(R.layout.cardviewfragment, container, false);
			return fView;
		}
	
		public static CardViewFragment newInstance()
		{
			CardViewFragment fragment = new CardViewFragment();
			fragment.setRetainInstance(true);
			return fragment;
		}
	
		public override void onViewCreated(View view, Bundle savedInstanceState)
		{
			mCardView = (CardView)view.findViewById(R.id.cardview);
			mRadiusSeekBar = (SeekBar)view.findViewById(R.id.cardview_radius_seekbar);
			
			MySeekBar msb = new MySeekBar();
			msb.fString = "SeekBar Radius progress : %d";
			msb.mCardViewRef = mCardView;
			msb.TAG = typeOf(CardViewFragment).getSimpleName();
			mRadiusSeekBar.setOnSeekBarChangeListener(msb);
			
			mElevationSeekBar = (SeekBar)view.findViewById(R.id.cardview_elevation_seekbar);
			msb = new MySeekBar();
			msb.fString = "SeekBar Elevation progress : %d";
			msb.mCardViewRef = mCardView;
			msb.TAG = typeOf(CardViewFragment).getSimpleName();
			mElevationSeekBar.setOnSeekBarChangeListener(msb);
		}
	}
}
