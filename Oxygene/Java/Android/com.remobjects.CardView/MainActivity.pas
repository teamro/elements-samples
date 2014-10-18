namespace com.remobjects.cardview;

interface

uses
  java.util,
  android.app,
  android.content,
  android.os,
  android.util,
  android.view,
  android.widget;

type
  MainActivity = public class(Activity)
  public
    method onCreate(savedInstanceState: Bundle); override;
  end;

implementation

//Launcher Activity for the CardView sample app.

method MainActivity.onCreate(savedInstanceState: Bundle);
begin
  inherited;
  // Set our view from the "main" layout resource
  ContentView := R.layout.activity_card_view;

  if (savedInstanceState = nil) then 
  begin
    getFragmentManager().beginTransaction().add(R.id.container, CardViewFragment.newInstance()).commit()
  end;

end;

end.
