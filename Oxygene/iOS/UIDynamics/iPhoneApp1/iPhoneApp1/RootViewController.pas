namespace iPhoneApp1;

interface

uses
  UIKit;

type
  [IBObject]
  RootViewController = public class(UIViewController)
  private
    var animator:UIDynamicAnimator;
    var collision:UICollisionBehavior;
    method addGravity(Sender:UIButton);
    method reload(Sender:id);
  public
    method init: id; override;
    method viewDidLoad; override;
  end;

implementation

method RootViewController.init: id;
begin
  self := inherited initWithNibName('RootViewController') bundle(nil);
  if assigned(self) then begin
    title := 'Playing with UIDynamics';
    navigationItem.rightBarButtonItem := UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItem.UIBarButtonSystemItemRefresh) target(self) action(selector(reload:)) ;
    // Custom initialization
  end;
  result := self;
end;

method RootViewController.viewDidLoad;
begin
  inherited viewDidLoad;
  view.backgroundColor := UIColor.grayColor();

  // setup UIDynamics animator and collition behavior
  if not assigned(animator) then begin
    animator := UIDynamicAnimator.alloc.initWithReferenceView(view);
    collision := UICollisionBehavior.alloc.init;
    collision.collisionMode := UICollisionBehaviorMode.UICollisionBehaviorModeEverything;
    collision.translatesReferenceBoundsIntoBoundary := YES;
    animator.addBehavior(collision);
  end;

  var label := UILabel.alloc.initWithFrame(CGRectMake(50,80,220,50));
  label.text := 'Tap in a ramdom order!';
  view.addSubview(label);


  // load "animated" SubViews
  reload(self); 

  // Do any additional setup after loading the view.
end;

method RootViewController.addGravity(Sender: UIButton);
begin
  // ON "TouchUpInside" on a Button add gravity behavior to the Sender (UIButton)
  var gravity:UIGravityBehavior := UIGravityBehavior.alloc.initWithItems([Sender]);
  animator.addBehavior(gravity);
  Sender.setTitle('got gravity ...') forState(UIControlState.UIControlStateNormal);
end;

method RootViewController.reload(Sender: id);
begin
  
  // cleanup existing UIButtons
  for i:Integer := view.subviews.count -1 downto 0 do begin
    var subView := view.subviews[i];
    if subView is UIButton then begin
      subView.removeFromSuperview();
      collision.removeItem(subView);
    end;
  end;

  // greate some UIButtons ans add them to the "Collition Manager"" 
  for I:Integer := 0 to 5 do begin
    var Btn := UIButton.alloc.initWithFrame(CGRectMake(50,140 + I*60,220,40));
    //Btn.buttonType := UIButtonType.UIButtonTypeCustom;
    view.addSubview(Btn);
    Btn.setTitle('Touch me :o)') forState(UIControlState.UIControlStateNormal);
    // Btn.setTitle('got Gravity ..') forState(UIControlState.UIControlStateHighlighted);
    Btn.backgroundColor := UIColor.blueColor;
    Btn.addTarget(self) 
        action(selector(addGravity:))
        forControlEvents(UIControlEvents.UIControlEventTouchUpInside ) ;
    collision.addItem(Btn);
  end;
end;


end.
