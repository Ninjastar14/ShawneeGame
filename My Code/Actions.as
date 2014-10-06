import flash.display.MovieClip;
import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.ui.Keyboard;
import flash.utils.Timer;

var keyPressed: uint;
// Moving Variables
var shiftPressed: Boolean;
var aPressed: Boolean;
var dPressed: Boolean;
var walkSpeed: Number = 5;
var runSpeed: Number = 1;

// Attacking Variables
var spacePressed: Boolean;
var sPressed: Boolean;
var oPressed:Boolean;
	
function initializeGame():void 
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
		if(Lloyd.currentLabel!="walking"){
		Lloyd.gotoAndPlay("walking");
		}
	}
	if (keyPressed == Keyboard.S) 
	{
		sPressed = true;
	}
	if (keyPressed == Keyboard.D) 
	{
		dPressed = true;
		if(Lloyd.currentLabel!="walking"){
		Lloyd.gotoAndPlay("walking");
		}
	}
	if (keyPressed == Keyboard.SPACE) 
	{
		spacePressed = true;
		
	}
	if (keyPressed == Keyboard.SHIFT)
	{
		shiftPressed = true;
		
		
	}
	if (keyPressed == Keyboard.O)
	{
		oPressed=true;
		if(Lloyd.currentLabel!="attack1"){
		Lloyd.gotoAndPlay("attack1");
		}
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
			Lloyd.gotoAndPlay("idle");
		}
		if (thisKey == Keyboard.D) 
		{
			dPressed = false;
			Lloyd.gotoAndPlay("idle");
		}
		if (thisKey == Keyboard.SHIFT)
		{
			shiftPressed = false;
			 Lloyd.gotoAndPlay("idle");
		}
		if(thisKey == Keyboard.O)
		{
			oPressed=false;
			 Lloyd.gotoAndPlay("idle");
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
		if(Lloyd.currentLabel!="run"){
		Lloyd.gotoAndPlay("run");
		}
		Lloyd.x += runSpeed;
		Lloyd.scaleX = 1;
	
	}
	
	if (aPressed && shiftPressed || shiftPressed && aPressed) 
	{
		if(Lloyd.currentLabel!="run"){
		Lloyd.gotoAndPlay("run");
		}
		Lloyd.x -= runSpeed;
		Lloyd.scaleX = -1;
	
		
	}
}
initializeGame();
