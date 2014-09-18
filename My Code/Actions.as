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
// Attacking Variables
var spacePressed: Boolean;
var sPressed: Boolean;

function initializeGame(): void 
{
	sPressed = false;
	aPressed = false;
	dPressed = false;
	spacePressed = false;
	shiftPressed = false;
	
	stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey);
	stage.addEventListener(KeyboardEvent.KEY_UP, releaseKey);
}

/*************
* Key Presses
**************/

function pressKey(event: KeyboardEvent): void 
{
	keyPressed = event.keyCode;
	if (keyPressed == Keyboard.A) 
	{
		aPressed = true;
		this.Lloyd.gotoAndPlay(13);
	}
	if (keyPressed == Keyboard.S) 
	{
		sPressed = true;
	}
	if (keyPressed == Keyboard.D) 
	{
		dPressed = true;
		this.Lloyd.gotoAndPlay(13);
	}
	if (keyPressed == Keyboard.SPACE) 
	{
		spacePressed = true;
	}
	if (keyPressed == Keyboard.SHIFT)
	{
		shiftPressed = true;
		this.Lloyd.gotoAndPlay(25);
	}
	Lloyd.addEventListener(Event.ENTER_FRAME, moving);
}

/**************
* Key Releases
***************/

function releaseKey(event: KeyboardEvent): void 
{
	var thisKey: uint = event.keyCode;
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
			this.LLoyd.gotoAndPlay(1);
		}
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
initializeGame();