Die d[][] = new Die[450][450];
void setup()
{
	size(600, 480);
	noLoop();
	for(int x = 25; x < 450; x = x+75){
		for(int y = 25; y < 450; y = y+75){
			d[x][y] = new Die(x, y);
		}
	}
	background(191, 252, 219);
}
void draw()
{
    int sum = 0;
	for(int x = 25; x < 450; x = x+75){
		for(int y = 25; y < 450; y = y+75){
			d[x][y].show();
			sum = sum+d[x][y].value;
		}
	}
	//Clear right side
	noStroke();
	fill(191, 252, 219);
	rect(480, 0, 120, 480);

	fill(0,0,0);
	textSize(26);
	text("TOTAL:", 480, 220);

	//Show sum text
	text(sum, 500, 250);

	//reset stroke for dice
	stroke(1);
}
class Die //models one single dice cube
{
	int myX, myY, value;
	Die(int x, int y) //constructor
	{
		myX = x;
		myY = y;
		this.roll();
	}
	void roll()
	{
		value = (int) (Math.random()*6) + 1;
	}
	void show()
	{
		fill(255,255,255);
		rect(myX, myY, 50, 50, 5);
		fill(0,0,0);
		switch (value) {
			case 1:
				ellipse(myX +25, myY+25, 10, 10);
				return;
			case 2:
				ellipse(myX+50/3, myY+50/3, 10, 10);
				ellipse(myX+50-(50/3), myY+50-(50/3), 10, 10);
				return;
			case 3:
				ellipse(myX+50/4, myY+50/4, 10, 10);
				ellipse(myX+50-(50/4), myY+50-(50/4), 10, 10);
				ellipse(myX +25, myY+25, 10, 10);
				return;
			case 4:
				ellipse(myX+50/4, myY+50/4, 10, 10);
				ellipse(myX+50-(50/4), myY+50-(50/4), 10, 10);
				ellipse(myX+50/4, myY+50-(50/4), 10, 10);
				ellipse(myX+50-(50/4), myY+50/4, 10, 10);
				return;
			case 5:
				ellipse(myX+50/4, myY+50/4, 10, 10);
				ellipse(myX+50-(50/4), myY+50-(50/4), 10, 10);
				ellipse(myX +25, myY+25, 10, 10);
				ellipse(myX+50/4, myY+50-(50/4), 10, 10);
				ellipse(myX+50-(50/4), myY+50/4, 10, 10);
				return;
			case 6:
				ellipse(myX+50/4, myY+50/4, 10, 10);
				ellipse(myX+50-(50/4), myY+50-(50/4), 10, 10);
				ellipse(myX+50/4, myY+50-(50/4), 10, 10);
				ellipse(myX+50-(50/4), myY+50/4, 10, 10);
				ellipse(myX+50/4, myY+25, 10, 10);
				ellipse(myX+50-(50/4), myY+25, 10, 10);
				return;
		}
		//System.out.println(value);
	}
}
void mouseClicked(){
	for(int x = 25; x < 450; x = x+75){
		for(int y = 25; y < 450; y = y+75){
			if(mouseX>=x && mouseX<=x+50 &&
				mouseY>=y && mouseY<=y+50){
				d[x][y].roll();
				//System.out.println(d[x][y].myX +" ," + d[x][y].myY);
			}
		}
	}
	redraw();
}