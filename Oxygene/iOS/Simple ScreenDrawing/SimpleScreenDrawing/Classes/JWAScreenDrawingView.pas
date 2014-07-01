namespace JWA.Oxygene.iOS.UI.Helpers;
// 
// Copyright (c) 2014 Jens Warkentin
// Author: Jens Warkentin, Email: jw@innovasoft.de
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the "Software"), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions: 
// 
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software. 
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE. 
//
interface

uses
  UIKit, CoreGraphics;

type
  [IBObject]
  JWAScreenDrawingView = public class(UIView, IUIGestureRecognizerDelegate)
  private
    _path: UIBezierPath;
  public
    method initWithFrame(aFrame: CGRect): id; override;
    method drawRect(rect: CGRect); override;

    // GestureRecognizerDelegate
    method touchesBegan(touches: NSSet) withEvent(&event: UIEvent); override;
    method touchesMoved(touches: NSSet) withEvent(&event: UIEvent); override;

    property path:UIBezierPath read _path;

  end;

implementation

method JWAScreenDrawingView.initWithFrame(aFrame: CGRect): id;
begin
  self := inherited initWithFrame(aFrame);
  if assigned(self) then begin

    // Custom initialization
    _path := new UIBezierPath;
    path.lineWidth := 2;
    backgroundColor := UIColor.whiteColor;

  end;
  result := self;
end;

method JWAScreenDrawingView.drawRect(rect: CGRect);
begin
  // Custom drawing code
  UIColor.blueColor.setStroke;
  path.stroke;
end;

// GestureRecognizerDelegate
method JWAScreenDrawingView.touchesBegan(touches: NSSet) withEvent(&event: UIEvent);
begin
  var touch := touches.anyObject;
  var p := touch.locationInView(self);

  path.moveToPoint(p);
end;

method JWAScreenDrawingView.touchesMoved(touches: NSSet) withEvent(&event: UIEvent);
begin
  var touch := touches.anyObject;
  var p := touch.locationInView(self);
  path.addLineToPoint(p);
  setNeedsDisplay;
end;

end.