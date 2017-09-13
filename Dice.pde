void setup()
{	
	size(600, 480);
	noLoop();
}
void draw()
{
	for(int x = 25; x < 450; x = x+75){
		for(int y = 25; y < 450; y = y+75){
			Die d = new Die(x, y);
			d.show();
		}
	}
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
		switch (value) {
			case 1:
				fill(0,0,0);
				ellipse(myX +25, myY+25, 10, 10);
			case 2:

			case 3:

			case 4:
			case 5:
			case 6:
		}
		System.out.println(value);
	}
}
void mouseClicked(){
	for(int x = 25; x < 450; x = x+75){
		for(int y = 25; y < 450; y = y+75){
			if(mouseX>=x && mouseX<=x+50 &&
				mouseY>=y && mouseY<=y+50){
				Die d = new Die(x, y);
				d.show();
				System.out.println(d.myX +" ," + d.myY);
			}
		}
	}
}