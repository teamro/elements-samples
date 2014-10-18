namespace com.remobjects.navigationdrawer;

interface

//https://developer.android.com/training/implementing-navigation/nav-drawer.html

uses
  java.util,
  android.app,
  android.content,
  android.content.res,
  android.os,
  android.util,
  android.view,
  android.widget,
  android.support.v4.widget,
  android.support.v4.app,
  android.support.v4.view;

type
  MainActivity = public class(Activity)
  protected
    method onPostCreate(savedInstanceState : Bundle); override;
  private
    var mDrawerLayout: DrawerLayout;
    var mDrawerList: ListView;
    var mDrawerToggle: MyActionBarDrawerToggle;//ActionBarDrawerToggle;
  public //private, if Oxygene supports annonymous classes.
    var mDrawerTitle: CharSequence;
    var mTitle: CharSequence;
    var mPlanetTitles: array of String;
  private
    method selectItem(position : Integer);
  public
    method onCreate(savedInstanceState: Bundle); override;
    method onCreateOptionsMenu(m : Menu) : Boolean; override;
    method onPrepareOptionsMenu(m : Menu) : Boolean; override;
    method onOptionsItemSelected(item : MenuItem): Boolean; override; 
    method setTitle(title : CharSequence ); override;
    method onConfigurationChanged(newConfig : Configuration ); override;
  end;

  //Not needed,if Oxygene supports annonymous classes. 
  MyActionBarDrawerToggle = public class(ActionBarDrawerToggle)
  public
    var Ref : MainActivity;
    method onDrawerClosed(aView: View); override; 
    method onDrawerOpened(aDrawerView: View); override; 
  end;

  PlanetFragment = public class(android.app.Fragment)
  public 
    const ARG_PLANET_NUMBER : String = "planet_number";
    constructor ();
    method onCreateView(inflater: LayoutInflater; container: ViewGroup; savedInstanceState: Bundle): View; override;
  end;

implementation

{**
 * This example illustrates a common usage of the DrawerLayout widget
 * in the Android support library.
 * <p/>
 * <p>When a navigation (left) drawer is present, the host activity should detect presses of
 * the action bar's Up affordance as a signal to open and close the navigation drawer. The
 * ActionBarDrawerToggle facilitates this behavior.
 * Items within the drawer should fall into one of two categories:</p>
 * <p/>
 * <ul>
 * <li><strong>View switches</strong>. A view switch follows the same basic policies as
 * list or tab navigation in that a view switch does not create navigation history.
 * This pattern should only be used at the root activity of a task, leaving some form
 * of Up navigation active for activities further down the navigation hierarchy.</li>
 * <li><strong>Selective Up</strong>. The drawer allows the user to choose an alternate
 * parent for Up navigation. This allows a user to jump across an app's navigation
 * hierarchy at will. The application should treat this as it treats Up navigation from
 * a different task, replacing the current task stack using TaskStackBuilder or similar.
 * This is the only form of navigation drawer that should be used outside of the root
 * activity of a task.</li>
 * </ul>
 * <p/>
 * <p>Right side drawers should be used for actions, not navigation. This follows the pattern
 * established by the Action Bar that navigation should be to the left and actions to the right.
 * An action should be an operation performed on the current contents of the window,
 * for example enabling or disabling a data overlay on top of the current content.</p>
 *}

method MainActivity.onCreate(savedInstanceState: Bundle);
begin
  inherited;
  // Set our view from the "main" layout resource
  ContentView := R.layout.main;


  mTitle := getTitle();
  mDrawerTitle := getTitle();

  mPlanetTitles := getResources().getStringArray(R.array.planets_array);
  mDrawerLayout := DrawerLayout(findViewById(R.id.drawer_layout));
  mDrawerList := ListView(findViewById(R.id.left_drawer));

  // set a custom shadow that overlays the main content when the drawer opens
  mDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);
  // set up the drawer's list view with items and click listener
  mDrawerList.setAdapter(new ArrayAdapter<String>(self, R.layout.drawer_list_item, mPlanetTitles));
  mDrawerList.setOnItemClickListener(new class ListView.OnItemClickListener(onItemClick := method (parent: AdapterView<Adapter>; v: View; position: Integer; id: Int64)
    begin  selectItem(position); end));

  // enable ActionBar app icon to behave as action to toggle nav drawer
  getActionBar().setDisplayHomeAsUpEnabled(true);
  getActionBar().setHomeButtonEnabled(true);

  // ActionBarDrawerToggle ties together the the proper interactions
  // between the sliding drawer and the action bar app icon
  mDrawerToggle := new MyActionBarDrawerToggle( //ActionBarDrawerToggle(
                self,                  // host Activity
                mDrawerLayout,         // DrawerLayout object
                R.drawable.ic_drawer,  // nav drawer image to replace 'Up' caret
                R.string.drawer_open,  // "open drawer" description for accessibility 
                R.string.drawer_close  // "close drawer" description for accessibility
                ); // creates call to onPrepareOptionsMenu() 
  mDrawerToggle.Ref := self;

  //if Oxygene supports annonymous classes.
  //mDrawerToggle := new ActionBarDrawerToggle(self, mDrawerLayout, R.drawable.ic_drawer, R.string.drawer_open, R.string.drawer_close){NOT SUPPORTED  = class
  //public
  //  method onDrawerClosed(view: View);
  //  method onDrawerOpened(drawerView: View);
  //end;
  //implementation
  //method onDrawerClosed(view: View);
  //begin
  //  inherited onDrawerClosed(view);
  //  getActionBar().setTitle(mTitle);
  //  invalidateOptionsMenu()
  //end;
  //
  //method onDrawerOpened(drawerView: View);
  //begin
  //  inherited onDrawerOpened(drawerView);
  //  getActionBar().setTitle(mDrawerTitle);
  //  invalidateOptionsMenu()
  //end;
  //};

  mDrawerLayout.setDrawerListener(mDrawerToggle);

  if savedInstanceState = nil then 
  begin
    selectItem(0)
  end;
end;

method MainActivity.onCreateOptionsMenu(m: Menu): Boolean;
begin
  var inflater: MenuInflater := getMenuInflater();
  inflater.inflate(R.menu.menu, m);
  exit inherited onCreateOptionsMenu(m);
end;

method MainActivity.onPrepareOptionsMenu(m: Menu): Boolean;
begin
  // If the nav drawer is open, hide action items related to the content view
  var drawerOpen: Boolean := mDrawerLayout.isDrawerOpen(mDrawerList);
  m.findItem(R.id.action_websearch).setVisible(not drawerOpen);
  exit inherited onPrepareOptionsMenu(m);
end;

method MainActivity.onOptionsItemSelected(item: MenuItem): Boolean;
begin
  // -- line 16 col 40: invalid Identifier
  // The action bar home/up action should open or close the drawer.
  // ActionBarDrawerToggle will take care of this.
  if mDrawerToggle.onOptionsItemSelected(item) then 
  begin
    exit true;
  end;
  // Handle action buttons
  case item.getItemId() of 
    R.id.action_websearch: 
    begin
      // create intent to perform web search for this planet
      var int: Intent := new Intent(Intent.ACTION_WEB_SEARCH);
      int.putExtra(SearchManager.QUERY, getActionBar().getTitle());
      // catch event that there's no activity to handle intent
      if int.resolveActivity(getPackageManager()) <> nil then 
      begin
        startActivity(int)
      end
      else 
      begin
        Toast.makeText(self, R.string.app_not_available, Toast.LENGTH_LONG).show();
      end;
    exit true;
    end
    else     
      exit inherited onOptionsItemSelected(item);
  end;
end;

method MainActivity.selectItem(position : Integer);
begin
  // update the main content by replacing fragments
  var f: android.app.Fragment := new PlanetFragment();
  var args: Bundle := new Bundle();
  args.putInt(PlanetFragment.ARG_PLANET_NUMBER, position);
  f.setArguments(args);

  var fm: android.app.FragmentManager := getFragmentManager();
  fm.beginTransaction().replace(R.id.content_frame, f).commit();

  // update selected item and title, then close the drawer
  mDrawerList.setItemChecked(position, true);
  setTitle(mPlanetTitles[position]);
  mDrawerLayout.closeDrawer(mDrawerList);
end;

method MainActivity.setTitle(title : CharSequence ); 
begin
  mTitle := title;
  getActionBar().setTitle(mTitle);
end;

method MainActivity.onPostCreate(savedInstanceState: Bundle);
begin
  inherited onPostCreate(savedInstanceState);
  // Sync the toggle state after onRestoreInstanceState has occurred.
  mDrawerToggle.syncState();
end;

method MainActivity.onConfigurationChanged(newConfig: android.content.res.Configuration);
begin
  inherited onConfigurationChanged(newConfig);
  // Pass any configuration change to the drawer toggls
  mDrawerToggle.onConfigurationChanged(newConfig);
end;

method MyActionBarDrawerToggle.onDrawerClosed(aView: View);
begin
  inherited onDrawerClosed(aView);
   Ref.getActionBar().setTitle(Ref.mTitle);
   Ref.invalidateOptionsMenu() // creates call to onPrepareOptionsMenu()
end;

method MyActionBarDrawerToggle.onDrawerOpened(aDrawerView: View);
begin
  inherited onDrawerOpened(aDrawerView);
  Ref.getActionBar().setTitle(Ref.mDrawerTitle);
  Ref.invalidateOptionsMenu() // creates call to onPrepareOptionsMenu()
end;

constructor PlanetFragment;
begin
  // Empty constructor required for fragment subclasses
end;

method PlanetFragment.onCreateView(inflater: LayoutInflater; container: ViewGroup; savedInstanceState: Bundle): View;
begin
  var rootView: View := inflater.inflate(R.layout.fragment_planet, container, false);
  var i: Integer := getArguments().getInt(ARG_PLANET_NUMBER);
  var planet: String := getResources().getStringArray(R.array.planets_array)[i];

  var imageId: Integer := getResources().getIdentifier(planet.toLowerCase(Locale.getDefault()), 'drawable', getActivity().getPackageName());
  (ImageView(rootView.findViewById(R.id.image))).setImageResource(imageId);
  getActivity().setTitle(planet);
  exit rootView;
end;

end.
