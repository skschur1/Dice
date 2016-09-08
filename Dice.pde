int dieTotal, reRoll;
void setup()
{
	size(600,600);
	noLoop();
	reRoll = 0;
}
void draw()
{
	dieTotal = 0;
	background((int)(Math.random()*257) + 1, 200, 200);
	for(int dieY = 30; dieY < 460; dieY += 60)
	{
		for(int dieX = 30; dieX < 550; dieX += 60)
		{
		Die bob = new Die(dieX, dieY);
		bob.show();
		dieTotal = dieTotal + bob.dieNum;
		}
	}
	fill(0);
	textSize(30);
	text("Die Total: "+ dieTotal, 40, 550);
	text("Rerolls: " + reRoll, 290, 550);
	text("Die Average: " + (dieTotal/72), 40, 590);
}
void mousePressed()
{
	redraw();
	reRoll++;
}
class Die //models one single dice cube
{
	int dieNum, myX, myY;
	Die(int x, int y) //constructor
	{
		myX = x;
		myY = y;
		roll();
	}
	void roll()
	{
			dieNum = (int)(Math.random()*6) + 1;
	}
	void show()
	{
		strokeWeight(1);
		fill((int)(Math.random()*157) + 100, (int)(Math.random()*157) + 100, (int)(Math.random()*157) + 100);
		rect(myX, myY, 50, 50);
		strokeWeight(10);
		if (dieNum == 1)
		{
			point(myX + 24, myY + 24);
		}
		else if(dieNum == 2)
		{
			point(myX + 11, myY + 11);
			point(myX + 39, myY + 39);
		}
		else if(dieNum == 3)
		{
			point(myX + 11, myY + 11);
			point(myX + 39, myY + 39);
			point(myX + 24, myY + 24);
		}
		else if(dieNum == 4)
		{
			point(myX + 11, myY + 11);
			point(myX + 11, myY + 39);
			point(myX + 39, myY + 11);
			point(myX + 39, myY + 39);
		}
		else if(dieNum == 5)
		{
			point(myX + 11, myY + 11);
			point(myX + 11, myY + 39);
			point(myX + 39, myY + 11);
			point(myX + 39, myY + 39);
			point(myX + 24, myY + 24);
		}
		else
		{
			point(myX + 11, myY + 11);
			point(myX + 11, myY + 24);
			point(myX + 11, myY + 39);
			point(myX + 39, myY + 11);
			point(myX + 39, myY + 24);
			point(myX + 39, myY + 39);
		}
	}
}
