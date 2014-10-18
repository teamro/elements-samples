namespace com.remobjects.cardview;

interface

uses
  java.util,
  android.app,
  android.content,
  android.os,
  android.util,
  android.view,
  android.widget,
  android.support.v7.widget;

//http://webtutsdepot.com/2011/12/03/android-sdk-tutorial-seekbar-example/

type
  CardViewFragment = public class(Fragment)
  private
    fView : View;

    (** The CardView widget. *)
    //@VisibleForTesting
    var mCardView: CardView;
    (**
     * SeekBar that changes the cornerRadius attribute for the {@link #mCardView} widget.
     *)
    //@VisibleForTesting
    var mRadiusSeekBar: SeekBar;

    (**
     * SeekBar that changes the Elevation attribute for the {@link #mCardView} widget.
     *)
    //@VisibleForTesting
    var mElevationSeekBar: SeekBar;
  public
  public
    method onCreate(savedInstanceState: Bundle); override;
    method onCreateView(inflater: LayoutInflater; container: ViewGroup; savedInstanceState: Bundle): View; override;
    method onViewCreated(v: View; savedInstanceState: Bundle); override;
    class method newInstance: CardViewFragment;
  end;

  MySeekBar = class(SeekBar.OnSeekBarChangeListener)
  public
    var mCardViewRef: CardView;
    var fString : String;
    var TAG: String;
    method onProgressChanged(seekBar: SeekBar; progress: Integer; fromUser: Boolean); 
    method onStartTrackingTouch(seekBar: SeekBar); 
    method onStopTrackingTouch(seekBar: SeekBar); 
  end;

implementation

method CardViewFragment.onCreate(savedInstanceState: Bundle);
begin
  inherited;
  // Warning, until after onCreateView you cannot access view items.
end;

method CardViewFragment.onCreateView(inflater: LayoutInflater; container: ViewGroup; savedInstanceState: Bundle): View; 
begin
  // Set our view from the "CardViewFragment" layout resource
  fView := inflater.inflate(R.layout.cardviewfragment, container, false);

  // Now you can access view items by using fView.findViewById


  // And return the view
  exit fView;
end;

class method CardViewFragment.newInstance(): CardViewFragment;
begin
  var fragment: CardViewFragment := new CardViewFragment();
  fragment.setRetainInstance(true);
  exit fragment
end;

method CardViewFragment.onViewCreated(v: View; savedInstanceState: Bundle);
var
  msb : MySeekBar;
begin
  inherited onViewCreated(v, savedInstanceState);

  mCardView := CardView(v.findViewById(R.id.cardview));
  
  mRadiusSeekBar := SeekBar(v.findViewById(R.id.cardview_radius_seekbar));
  msb := new MySeekBar();
  msb.fString := "SeekBar Radius progress : %d";
  msb.mCardViewRef := mCardView;
  msb.TAG := typeOf(CardViewFragment).getSimpleName();
  mRadiusSeekBar.setOnSeekBarChangeListener(msb);

  mElevationSeekBar := SeekBar(v.findViewById(R.id.cardview_elevation_seekbar));
  msb := new MySeekBar();
  msb.fString := "SeekBar Elevation progress : %d";
  msb.mCardViewRef := mCardView;
  msb.TAG := typeOf(CardViewFragment).getSimpleName();
  mElevationSeekBar.setOnSeekBarChangeListener(msb)
end;

method MySeekBar.onProgressChanged(seekBar: SeekBar; progress: Integer; fromUser: Boolean);
begin
  Log.d(TAG, String.format(fString, progress));
  mCardViewRef.setRadius(progress);
end;

method MySeekBar.onStartTrackingTouch(seekBar: SeekBar);
begin
// Do nothing
end;

method MySeekBar.onStopTrackingTouch(seekBar: SeekBar);
begin
// Do nothing
end;


end.