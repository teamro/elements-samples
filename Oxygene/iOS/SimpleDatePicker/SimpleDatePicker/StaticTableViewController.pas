namespace SimpleDatePicker;

interface

uses
  UIKit,
  JWA.Oxygene.iOS.UI.Helpers;

type
  [IBObject]
  StaticTableViewController = public class(UITableViewController, IUITextFieldDelegate)
  private
    [IBOutlet] property DateInputTextViewOutlet: UITextField; 
    [IBOutlet] property TimeInputTextViewOutlet: UITextField;
    [IBOutlet] property DateTimeInputTextViewOutlet: UITextField;

    //* UITextFieldDelegate *//
    method textFieldShouldReturn(textField: UITextField): BOOL;
  protected
    property datePicker:JWADatePicker;
    property timePicker:JWADatePicker;
    property dateTimePicker:JWADatePicker;
  public
    method init: instancetype; override;
    method viewDidLoad; override;
  end;

implementation

method StaticTableViewController.init: instancetype;
begin
  self := inherited initWithStyle(UITableViewStyle.UITableViewStylePlain);
  if assigned(self) then begin

    // Custom initialization

  end;
  result := self;
end;

method StaticTableViewController.viewDidLoad;
begin
  inherited viewDidLoad;
  title := 'Simple Date Picker';

  // initialize DatePickers and Textfield InputViews
  datePicker := JWADatePicker.alloc.initWithDateFormatString('yyyy/MM/dd') 
                                    forTextfield(DateInputTextViewOutlet) 
                                    withDatePickerMode(UIDatePickerMode.UIDatePickerModeDate)
                                    resignFirstResponderOnDateSelected(true);
  timePicker := JWADatePicker.alloc.initWithDateFormatString('hh:mm') 
                                    forTextfield(TimeInputTextViewOutlet) 
                                    withDatePickerMode(UIDatePickerMode.UIDatePickerModeTime); 
  
  dateTimePicker := JWADatePicker.alloc.initWithDateFormatString('yyyy/MM/dd hh:mm') 
                                    forTextfield(DateTimeInputTextViewOutlet) 
                                    withDatePickerMode(UIDatePickerMode.UIDatePickerModeDateAndTime); 

  // set initial Values
  datePicker.date := NSDate.date;
  timePicker.date := NSDate.date;
  dateTimePicker.date := NSDate.date;
end;

//* UITextFieldDelegate *//
method StaticTableViewController.textFieldShouldReturn(textField: UITextField): BOOL;
begin
  // support RETURN key (ex: for bluetooth keyboards)
  textField.resignFirstResponder();
  exit YES;
end;

end.
