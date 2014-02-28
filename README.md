ARAlert
======

Hermes is a custom alert modal class used to display alerts to uses

Adding Messenger Window
```
[ARAlert showAlertWithMessage:@"Hello World" completionBlock:nil];
```

##Adding Buttons:

You have 2 types of buttons, Action and Dismiss

###Action Buttons: 
These buttons prompt action. A user may be notified to choose A or B. Both would be action buttons because on select we would want to then take action
```
kARAlertButtonTypeKey: @(ARAlertButtonTypeAction)
```

###Dismiss Buttons:
These buttons are for simple messages like "Sorry that didn't work." It's just a button that needs no further action and just dismisses the message.
```
kARAlertButtonTypeKey: @(ARAlertButtonTypeDismiss)
```

```
NSDictionary *options = @{
	kARAlertTextKey: @"hello world",
	kARAlertButtonsKey : @[
		@{
			kARAlertButtonTextKey:@"Goodbye",
			kARAlertButtonTypeKey: @(ARAlertButtonTypeDismiss)
		},
		@{
			kARAlertButtonTextKey : @"Hello", 
			kARAlertButtonTypeKey: @(ARAlertButtonTypeAction)
		}
	]
};
```

Init our ARAlert Messenger
```
message = [ARAlert showAlertWithOptions:options completionBlock:nil];
```

###Buttons have two size options, Full and Half.
	
	
Dismissing Action Modals
To dismiss a modal on an action button you will need to have saved a reference to the Hermes Message
```
[message dismissModal];
```
