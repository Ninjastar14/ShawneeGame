var Gravity:Number = 1.5;
var JumpPower:Number = 0;
var CanJump:Boolean = false;
var Jumped:Boolean = false;
//Dash variable

//If on floor and can jump
if (CanJump)
{
	//If right key is pressed run right
	if (RightKeyPress)
	{
		x +=  RunSpeed;
		gotoAndStop('Run');
		scaleX = 1;
	}
	else if (LeftKeyPress)
	{
		//otherwise if left key is pressed run left
		x -=  RunSpeed;
		gotoAndStop('Run');
		scaleX = -1;
	}

	if (UpKeyPress)
	{
		//If up key is pressed then jump
		JumpPower = -15;
		CanJump = false;
		gotoAndStop('Jump');
		Jumped = true;
	}

	//If no key is pressed stay idle
	if (! RightKeyPress && ! LeftKeyPress && CanJump)
	{
		gotoAndStop('Idle');
	}
}
else if ((CanJump == false))
{
	//Otherwise if in air and right key is pressed move right
	if (RightKeyPress)
	{
		x +=  RunSpeed;
		scaleX = 1;
	}
	else if (LeftKeyPress)
	{
		//Otherwise if left key is pressed then move left
		x -=  RunSpeed;
		scaleX = -1;
	}
}