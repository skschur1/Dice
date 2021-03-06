int dieTotal, reRoll, dieRows, dieColumns;
void setup()
{
	size(540,600);
	noLoop();
	reRoll = 0;
	dieRows = 4;
	dieColumns = 4;
}
void draw()
{
	dieTotal = 0;
	background((int)(Math.random()*257) + 1, 200, 200);
	for(int dieY = 30; dieY < dieRows * 60; dieY += 60)
	{
		for(int dieX = 30; dieX < dieColumns * 60; dieX += 60)
		{
		Die bob = new Die(dieX, dieY);
		bob.show();
		dieTotal = dieTotal + bob.dieNum;
		}
	}
	fill(0);
	textSize(30);
	text("Dice Total: "+ dieTotal, 40, 550);
	text("Rerolls: " + reRoll, 290, 550);
	text("Rows: " + dieRows, 40, 590);
	text("Columns: " + dieColumns, 290, 590);
}
void keyPressed()
{
	if(keyCode == UP && dieRows > 1)
	{
		dieRows-=1;
		redraw();
	}
	else if(keyCode == DOWN && dieRows < 8)
	{
		dieRows+=1;
		redraw();
	}
	else if (keyCode == LEFT && dieColumns > 1) 
	{
		dieColumns-=1;
		redraw();
	}
	else if (keyCode == RIGHT && dieColumns < 8)
	{
		dieColumns+=1;
		redraw();
	}
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
		rect(myX, myY, 50, 50, 10);
		strokeWeight(10);
		if (dieNum == 1)
		{
			point(myX + 25, myY + 25);
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
			point(myX + 25, myY + 25);
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
			point(myX + 25, myY + 25);
		}
		else
		{
			point(myX + 11, myY + 11);
			point(myX + 11, myY + 25);
			point(myX + 11, myY + 39);
			point(myX + 39, myY + 11);
			point(myX + 39, myY + 25);
			point(myX + 39, myY + 39);
		}
	}
}
