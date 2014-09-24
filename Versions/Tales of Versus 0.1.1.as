import flash.display.MovieClip;
import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.ui.Keyboard;

var keyPressed: uint;
// Moving Variables
var shiftPressed: Boolean;
var aPressed: Boolean;
var dPressed: Boolean;
var walkSpeed: Number = 5;
var runSpeed: Number = 8;
// Jumping Variables
var wPressed: Boolean;
var jumping: Boolean;
var gravity:Number = 10;
var jumpPower:Number = 0;

function initializeGame(): void 
{
	// Moving Keys
	aPressed = false;
	dPressed = false;
	shiftPressed = false;
	// Jumping Keys
	wPressed = false;
	jumping = false;
	
	// Key Press Listeners
	stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey);
	stage.addEventListener(KeyboardEvent.KEY_UP, releaseKey);
	// Jumping Listeners
	stage.addEventListener(Event.ENTER_FRAME, jumps);
}

/*************
* Key Presses
**************/

function pressKey(event: KeyboardEvent): void 
{
	keyPressed = event.keyCode;
	/*
	*if (thisKey == Keyboard.)
		{
			Pressed = true;
		}
	*/
	// Moving and Jump Keys
	if(keyPressed == Keyboard.W)
	{
		wPressed = true;
		if(jumping != true)
		{
			jumpPower = -50;
			jumping = true;
		}
	}
	if (keyPressed == Keyboard.A) 
	{
		aPressed = true;
		this.Lloyd.gotoAndPlay(13);
	}
	if (keyPressed == Keyboard.D) 
	{
		dPressed = true;
		this.Lloyd.gotoAndPlay(13);
	}
	if (keyPressed == Keyboard.SHIFT)
	{
		shiftPressed = true;
		this.Lloyd.gotoAndPlay(25);
	}
	// Listener for Lloyd to switch animation frames
	Lloyd.addEventListener(Event.ENTER_FRAME, moving);
}

/**************
* Key Releases
***************/

function releaseKey(event: KeyboardEvent): void 
{
	/*
	*if (thisKey == Keyboard.)
		{
			Pressed = false;
		}
	*/
	var thisKey: uint = event.keyCode;
	// Moving and Jumps
		if (thisKey == Keyboard.W)
		{
			wPressed = false;
		}
		if (thisKey == Keyboard.A) 
		{
			aPressed = false;
			this.Lloyd.gotoAndPlay(1);
		}
		if (thisKey == Keyboard.D) 
		{
			dPressed = false;
			this.Lloyd.gotoAndPlay(1);
		}
		if (thisKey == Keyboard.SHIFT)
		{
			shiftPressed = false;
			this.Lloyd.gotoAndPlay(1);
		}

/***********************
* Movements and Attacks
************************/
// Moving
function moving(event: Event): void 
{
	// Walking Speed
	if (dPressed) 
	{
		Lloyd.x += walkSpeed;
		Lloyd.scaleX = 1;
	}
	if (aPressed) 
	{
		Lloyd.x -= walkSpeed;
		Lloyd.scaleX = -1;
	}
	// Running Speed
	if (dPressed && shiftPressed || shiftPressed && dPressed) 
	{
		Lloyd.x += runSpeed;
		Lloyd.scaleX = 1;
	}
	if (aPressed && shiftPressed || shiftPressed && aPressed) 
	{
		Lloyd.x -= runSpeed;
		Lloyd.scaleX = -1;
	}
}

function jumps(event:Event):void
{
	if(jumping)
	{
		Lloyd.y += jumpPower;
		jumpPower += gravity;
		
		if (Lloyd.y >= stage.stageHeight - 54)
		{
			jumping = false;
			Lloyd.y = stage.stageHeight - 54;
		}
	}
}
initializeGame();