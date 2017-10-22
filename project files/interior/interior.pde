import saito.objloader.*;
import processing.video.*;
import processing.opengl.*;
import codeanticode.gsvideo.*;
import jp.nyatla.nyar4psg.*;
import picking.*;

GSCapture cam;
MultiMarker nya;

float rotX=0,rotY=(-PI/2),i=1;
int flag=0,count=0;
OBJModel[] models=new OBJModel[10];
boolean texture=true;
void setup()
{
  size(640,480,P3D);

  noStroke();
  cam=new GSCapture(this,640,480);
  cam.start();
  nya = new MultiMarker(this,width,height,"camera_para.dat");
  nya.addARMarker("patt.leta",80);
  nya.addARMarker("patt.letr",80);
  nya.addARMarker("patt.lets",80);
 
  models[0]=new OBJModel(this,"sofa.obj");
  models[1]=new OBJModel(this,"sof.obj");

  models[4]=new OBJModel(this,"arm2.obj");
  models[5]=new OBJModel(this,"arm3.obj");

}

void draw()
{
  frameRate(10);
  cam.read();
  nya.detect(cam);
  background(0);
  lights();
  nya.drawBackground(cam);
  if(count%2==0)
  {
    // Brown SOFA
    if(nya.isExistMarker(2))
    {
      
      nya.beginTransform(2);
  
      models[0].enableTexture();
      models[0].translateToCenter();
      scale(i,i,i);
      rotateX(-PI/2);
      rotateX(rotY);
     rotateY(rotX);
      models[0].draw();
      nya.endTransform();
    }
    
    //ARMCHAIR RED
   if(nya.isExistMarker(0))
    {
   
      nya.beginTransform(0);
      models[4].enableTexture();
      models[4].translateToCenter();
      scale(i,i,i);
      
            rotateX(-PI/2);
      rotateX(rotY);
     rotateY(rotX);
      
      models[4].draw();
    
      nya.endTransform();
    }  
    
  }
  else
  {
    //SOFA white
    if(nya.isExistMarker(2))
    {
      
      nya.beginTransform(2);
      models[1].enableTexture();
      models[1].translateToCenter();
      scale(i,i,i);
       rotateX(-PI/2);
     rotateX(rotY);
      rotateY(rotX);
      models[1].draw();
      nya.endTransform();
    }
    //ARMCHAIR gREEN
    if(nya.isExistMarker(0))
    {
     
      nya.beginTransform(0);
      models[5].enableTexture();
      models[5].translateToCenter();
      scale(i,i,i);
       rotateX(-PI/2);
      rotateX(rotY);
     rotateY(rotX);
      models[5].draw();
     // if(flag==0)
	//rotX+=0.08;
      nya.endTransform();
    }
  } 
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
  count++;
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
         i=i+0.1;
    } 
    else if (keyCode == DOWN) 
    {
         i=i-0.1;
    } 
  } 
}
