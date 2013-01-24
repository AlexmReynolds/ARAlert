Hermes
======

Hermes is a custom alert modal class used to display alerts to uses

Adding Hermes Messenger Window
Hermes *message = [[Hermes alloc] initWithMessage:@"test \n this is a message \n so deal"];

Adding Buttons:

	You have 2 types of buttons, Action and Dismiss

	Action Buttons: 
		These buttons prompt action. A user may be notified to choose A or B. Both would be action buttons because on select we would want to then take action

	Dismiss Buttons:
		These buttons are for simple messages like "Sorry that didn't work." It's just a button that needs no further action and just dismisses the message.
	
	Example of Action button: [message addActionButton:@"ClickME" position:HermesButtonFull action:@selector(clicked:) delegate:self];
	Example of Dismiss Button: [message addDismissButton:@"Ok" position:HermesButtonFull];

	Buttons have two size options, Full and Half. 
	
Showing the Message:
	You can show a message by doing [message show];
	Or you can show a timed popup by doing [message fadeInAndOut:duration];
	
Dismissing Action Modals
	To dismiss a modal on an action button you will need to have saved a reference to the Hermes Message
	[message dismissModal];
