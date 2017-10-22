import processing.video.*;
import processing.opengl.*;
import codeanticode.gsvideo.*;
import jp.nyatla.nyar4psg.*;
import saito.objloader.*;


GSCapture cam;
MultiMarker nya;
PImage x;
GSMovie myMovie;
OBJModel build;
float rotX=(-PI/2);
int flag=0,flag1=0;
static float x1=0.0,y=0.0,z=0.0,rotY=0;
boolean texture=true;
void setup()
{
  size(640,480,P3D);
  myMovie=new GSMovie(this,"movie.mp4");
  cam=new GSCapture(this,640,480);
  cam.start();
  nya = new MultiMarker(this,width,height,"camera_para.dat");
  nya.addARMarker("patt.camlin",80);  
}
void mouseDragged()
{

rotX += (mouseX - pmouseX) * 0.01;
rotY -= (mouseY - pmouseY) * 0.01;
  
}

void mouseClicked()
{
  if(flag==0)
    flag=1;
  else
    flag=0;
}

void movieEvent(GSMovie movie)
{
  movie.read();
  
}
void draw()
{
  frameRate(20);
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);
// VIDEO sd
  if(nya.isExistMarker(0))
  {
    nya.beginTransform(0);
  if(x1<0.4&&y<0.4&&z<0.4)
  {
     x1+=0.01;
     y+=0.01;
     z+=0.01;
  
     if(rotY<PI)
     {
         rotY+=0.08;
     }
  }
  rotateY(rotY);
  scale(x1,y,z);

   rotate(3*PI/2);
   if(flag==0)
  myMovie.play();
  else
  myMovie.pause();
  image(myMovie,-100,-100);
    nya.endTransform();
  }

}



