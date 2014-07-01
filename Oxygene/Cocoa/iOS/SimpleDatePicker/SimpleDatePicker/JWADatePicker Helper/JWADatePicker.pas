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
  Foundation,UIKit;

type
  JWADatePicker = public class (UIDatePicker)
  private
    property dateFormatter:NSDateFormatter;
    property textField:UITextField;
    property resignFirstResponderOnDateSelected:Boolean;
  protected
    method dateSelected(sender:id);
  public
    method setDate(date:NSDate); override;
    method init: instancetype; override;
    method initWithDateFormatString(aDateFormatString:String) forTextfield(aTextfield:UITextField) withDatePickerMode(aDatePickerMode:UIDatePickerMode):instancetype;
    method initWithDateFormatString(aDateFormatString:String) forTextfield(aTextfield:UITextField) withDatePickerMode(aDatePickerMode:UIDatePickerMode) resignFirstResponderOnDateSelected(aResignFirstResponderOnDateSelected:Boolean):instancetype;
  end;

implementation

method JWADatePicker.init: instancetype;
begin
  self := inherited.init;
  if not assigned(self) then exit(nil);
  result := self;
end;

method JWADatePicker.initWithDateFormatString(aDateFormatString: String) forTextfield(aTextfield: UITextField) withDatePickerMode(aDatePickerMode: UIDatePickerMode) resignFirstResponderOnDateSelected(aResignFirstResponderOnDateSelected: Boolean): instancetype;
begin
  init;
 
  if not assigned(self) then exit(nil);

  datePickerMode := aDatePickerMode;
  textField := aTextfield;
  textField.inputView := self;

  dateFormatter := new NSDateFormatter;
  dateFormatter.dateFormat := aDateFormatString;

  addTarget(result) action(selector(dateSelected:)) forControlEvents(UIControlEvents.UIControlEventValueChanged);

  resignFirstResponderOnDateSelected := aResignFirstResponderOnDateSelected;

  result := self;

end;


method JWADatePicker.initWithDateFormatString(aDateFormatString: String) forTextfield(aTextfield: UITextField) withDatePickerMode(aDatePickerMode: UIDatePickerMode): instancetype;
begin
  // resignFirstResponder after choosing a date - default FALSE
  result := initWithDateFormatString(aDateFormatString) 
                        forTextfield(aTextfield) 
             withDatePickerMode(aDatePickerMode)
       resignFirstResponderOnDateSelected(false); 
end;

method JWADatePicker.dateSelected(sender: id);
begin

  if assigned(textField) then begin
    textField.text := dateFormatter.stringFromDate(self.date);
    if resignFirstResponderOnDateSelected then 
      textField.resignFirstResponder();
  end;
end;

method JWADatePicker.setDate(date: NSDate);
begin
  inherited.setDate(date);
  dateSelected(nil);
end;

end.
