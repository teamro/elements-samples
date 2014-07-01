namespace simpleScreenDrawing;

interface

uses
  UIKit, CoreGraphics,
  JWA.Oxygene.iOS.UI.Helpers;

type
  [IBObject]
  RootViewController = public class(UIViewController, IUIGestureRecognizerDelegate)
  private
    FDrawingView: JWAScreenDrawingView;
  public
    method init: id; override;

    method viewDidLoad; override;

    // Actions & Outlets
    [IBAction] method clearButtonTouchUpInside(sender:id);

  end;

implementation

method RootViewController.init: id;
begin
  self := inherited initWithNibName('RootViewController') bundle(nil);
  if assigned(self) then begin

    title := 'Simple ScreenDrawing';

    // Custom initialization

  end;
  result := self;
end;

method RootViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Do any additional setup after loading the view.

  // init the "drawing View""
  FDrawingView := new JWAScreenDrawingView;
  FDrawingView.frame := CGRectMake(10,80,view.frame.size.width-20, view.frame.size.height-310);

  // add to "RootViewControler.View"
  view.backgroundColor := UIColor.grayColor;
  view.addSubview(FDrawingView);
end;

method RootViewController.clearButtonTouchUpInside(sender: id);
begin
  FDrawingView.path.removeAllPoints;
  FDrawingView.backgroundColor := UIColor.whiteColor;
  FDrawingView.setNeedsDisplay; 
end;



end.
