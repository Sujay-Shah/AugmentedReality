import saito.objloader.*;
import processing.opengl.*;
import codeanticode.gsvideo.*;
import jp.nyatla.nyar4psg.*;

GSCapture cam;
MultiMarker nya;
OBJModel[] models=new OBJModel[26];
boolean texture=true;
PFont f;
float rotX=0,rotY=(-PI/2);
static float x1=0.0,y=0.0,z=0.0;
int flag=0;


void setup()
{
  size(640,480,P3D);
  noStroke();
  cam=new GSCapture(this,640,480);
  cam.start();
  nya = new MultiMarker(this,width,height,"camera_para.dat");
  // ADDING MARKERS
  nya.addARMarker("patt.leta",80);
  nya.addARMarker("patt.letb",80);
  nya.addARMarker("patt.letc",80);
  nya.addARMarker("patt.letd",80);
  nya.addARMarker("patt.lete",80);
  nya.addARMarker("patt.letf",80);
  nya.addARMarker("patt.letg",80);
  nya.addARMarker("patt.leth",80);
  nya.addARMarker("patt.leti",80);
  nya.addARMarker("patt.letj",80);
  nya.addARMarker("patt.letk",80);
  nya.addARMarker("patt.letl",80);
  nya.addARMarker("patt.letm",80);
  nya.addARMarker("patt.letn",80);
  nya.addARMarker("patt.leto",80);
  nya.addARMarker("patt.letp",80);
  nya.addARMarker("patt.letq",80);
  nya.addARMarker("patt.letr",80);
  nya.addARMarker("patt.lets",80);
  nya.addARMarker("patt.lett",80);
  nya.addARMarker("patt.letu",80);
  nya.addARMarker("patt.letv",80);
  nya.addARMarker("patt.letw",80);
  nya.addARMarker("patt.letx",80);
  nya.addARMarker("patt.lety",80);
  nya.addARMarker("patt.letz",80);
  
  // Initiallising 3D objetcs
  models[0] = new OBJModel(this,"apple.obj");
  models[1] = new OBJModel(this,"football.obj");
  models[2] = new OBJModel(this,"cat.obj");
  models[3] = new OBJModel(this,"dog.obj");
  models[4] = new OBJModel(this,"elephant.obj");
  models[5] = new OBJModel(this,"flower.obj");
  models[6] = new OBJModel(this,"gun.obj");
  models[7] = new OBJModel(this,"hammer.obj");
  models[8] = new OBJModel(this,"iphone.obj");
  /*models[9] = new OBJModel(this,"jet.obj");
  models[10] = new OBJModel(this,"knife.obj");
  models[11] = new OBJModel(this,"lamp1.obj");
  models[12] = new OBJModel(this,"missile.obj");
  models[13] = new OBJModel(this,"nail.obj");
  models[14] = new OBJModel(this,"ostrich.obj");
  models[15] = new OBJModel(this,"pear.obj");
  models[16] = new OBJModel(this,"quadbike.obj");
  models[17] = new OBJModel(this,"rabbit.obj");
  models[18] = new OBJModel(this,"snowman.obj");
  models[19] = new OBJModel(this,"Wooden Table 1.obj");
  models[20] = new OBJModel(this,"Umbrella.obj");
  models[21] = new OBJModel(this,"vase.obj");
  models[22] = new OBJModel(this,"well.obj");
  models[23] = new OBJModel(this,"xbow.obj");
  models[23].scale(2);
  models[24] = new OBJModel(this,"yacht.obj");
  models[24].scale(2);
  models[24].translateToCenter();
  models[25] = new OBJModel(this,"zombie.obj");*/
  f=createFont("Aardvark",72,true);

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

void draw()
{
  frameRate(10);
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);
  // APPLE 
  if(nya.isExistMarker(0))
  {
  textFont(f);
   fill(0,128,255);
   textAlign(CENTER);
   text("Apple",width/2,150);
   fill(255,255,83);
   text("Apple",(width/2)-7,150);
   
   nya.beginTransform(0);
   lights();
   models[0].enableTexture();
   texture=true;
   models[0].translateToCenter();
   rotateX(rotY);
   rotateY(rotX);
   models[0].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  //BAll
  if(nya.isExistMarker(1))
  {
  textFont(f);
   fill(255,51,51);
   textAlign(CENTER);
   text("Ball",width/2,150);
   fill(255,201,14);
   text("Ball",(width/2)-7,150);
   nya.beginTransform(1);
   lights();
   
   models[1].enableTexture();
   texture=true;
   models[1].translateToCenter();
   rotateX(rotY);
   rotateY(rotX);
   models[1].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  // CAT
  if(nya.isExistMarker(2))
  {
  textFont(f);
   fill(66,0,132);
   textAlign(CENTER);
   text("Cat",width/2,150);
   fill(255,158,62);
   text("Cat",(width/2)-7,150);
   nya.beginTransform(2);
   lights();
  models[2].enableTexture();
       texture=true;
      rotateX(rotY);
      rotateY(rotX);
   models[2].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  // DoG
  if(nya.isExistMarker(3))
  {
  textFont(f);
  fill(255,255,19);
   textAlign(CENTER);
   text("Dog",width/2,150);
    fill(186,24,174);
   text("Dog",(width/2)-7,150);
   nya.beginTransform(3);
   lights();
  models[3].enableTexture();
    texture=true;
     rotateX(rotY);
   rotateY(rotX);
   models[3].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
  if(nya.isExistMarker(4))
  {
  textFont(f);
   fill(0,128,255);
   textAlign(CENTER);
   text("Elephant",width/2,150);
   fill(255,255,83);
   text("Elephant",(width/2)-7,150);
   nya.beginTransform(4);
   lights();
     models[4].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[4].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  
 if(nya.isExistMarker(5))
  {
  textFont(f);
   fill(255,51,51);
   textAlign(CENTER);
   text("Flower",width/2,150);
   fill(255,201,14);
   text("Flower",(width/2)-7,150);
   nya.beginTransform(5);
   lights(); 
   models[5].enableTexture();
     texture=true;
     rotateX(rotY);
   rotateY(rotX);
   models[5].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
  if(nya.isExistMarker(6))
  {
  textFont(f);
   fill(66,0,132);
   textAlign(CENTER);
   text("Gun",width/2,150);
   fill(255,158,62);
   text("Gun",(width/2)-7,150);
   nya.beginTransform(6);
   lights();
     models[6].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[6].draw();
   if(flag==0)
   rotX+=0.08;

     
   
   nya.endTransform();
  }
  
  if(nya.isExistMarker(7))
  {
  textFont(f);
   textAlign(CENTER);
   text("Hammer",width/2,150);
   fill(0,223,0);
   text("Hammer",(width/2)-7,150);
   nya.beginTransform(7);
   lights();
   models[7].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[7].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
  
  if(nya.isExistMarker(8))
  {
  textFont(f);
   fill(255,106,6);
   textAlign(CENTER);
   text("iPhone",width/2,150);
   fill(55,155,255);
   text("iPhone",(width/2)-7,150);
   nya.beginTransform(8);
   lights();
  
    models[8].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[8].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
 /* 
  if(nya.isExistMarker(9))
  {
  textFont(f);
   fill(255,255,19);
   textAlign(CENTER);
   text("Jet",width/2,150);
   fill(186,24,174);
   text("Jet",(width/2)-7,150);
   nya.beginTransform(9);
   lights();
    models[9].enableTexture();
    texture=true;
    
   rotateX(rotY);
   rotateY(rotX);
   models[9].draw();
   if(flag==0)
   rotX+=0.08;

     
   
   nya.endTransform();
  }
  
  if(nya.isExistMarker(10))
  {
  textFont(f);
   fill(0,128,255);
   textAlign(CENTER);
   text("Knife",width/2,150);
   fill(255,255,83);
   text("Knife",(width/2)-7,150);
   
   nya.beginTransform(10);
   lights();
 
  models[10].enableTexture();
       texture=true;
       rotateX(rotY);
   rotateY(rotX);
   models[10].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  

  if(nya.isExistMarker(11))
  {
  textFont(f);
   fill(255,51,51);
   textAlign(CENTER);
   text("Lamp",width/2,150);
   fill(255,201,14);
   text("Lamp",(width/2)-7,150);
   
   nya.beginTransform(11);
   lights();
 
      models[11].enableTexture();
       texture=true;
   
        rotateX(rotY);
   rotateY(rotX);
   models[11].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  
  if(nya.isExistMarker(12))
  {
  textFont(f);
   fill(66,0,132);
   textAlign(CENTER);
   text("Missile",width/2,150);
   fill(255,158,62);
   text("Missile",(width/2)-7,150);
   
   nya.beginTransform(12);
   lights();
 
      models[12].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[12].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }

  if(nya.isExistMarker(13))
  {
  textFont(f);
   fill(255,0,0);
   textAlign(CENTER);
   text("Nail",width/2,150);
   fill(0,223,0);
   text("Nail",(width/2)-7,150);
   
   nya.beginTransform(13);
   lights();
 
      models[13].enableTexture();
       texture=true;
       rotateX(rotY);
   rotateY(rotX);
   models[13].draw();
   if(flag==0)
   rotX+=0.08;


   nya.endTransform();
  }
  
  if(nya.isExistMarker(14))
  {
  textFont(f);
   fill(255,106,6);
   textAlign(CENTER);
   text("Ostrich",width/2,150);
   fill(55,155,255);
   text("Ostrich",(width/2)-7,150);
   
   nya.beginTransform(14);
   lights();
 
      models[14].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[14].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }

  if(nya.isExistMarker(15))
  {
  textFont(f);
   fill(186,24,174);
   textAlign(CENTER);
   text("Pear",width/2,150);
   fill(255,255,19);
   text("Pear",(width/2)-7,150);
   
   nya.beginTransform(15);
   lights();
 
      models[15].enableTexture();
       texture=true;
        rotateX(rotY);
   rotateY(rotX);
   models[15].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
  if(nya.isExistMarker(16))
  {
  textFont(f);
   fill(0,128,255);
   textAlign(CENTER);
   text("Quadbike",width/2,150);
   fill(255,255,83);
   text("Quadbike",(width/2)-7,150);
   
   nya.beginTransform(16);
   lights();
 
      models[16].enableTexture();
       texture=true;
     rotateX(rotY);
   rotateY(rotX);
   models[16].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
  
  if(nya.isExistMarker(17))
  {
  textFont(f);
   fill(255,51,51);
   textAlign(CENTER);
   text("Rabbit",width/2,150);
   fill(255,201,14);
   text("Rabbit",(width/2)-7,150);
   
   nya.beginTransform(17);
   lights();
 
      models[17].enableTexture();
       texture=true;
        rotateX(rotY);
   rotateY(rotX);
   models[17].draw();
   if(flag==0)
   rotX+=0.08;


   nya.endTransform();
  }

  if(nya.isExistMarker(18))
  {
  textFont(f);
   fill(66,0,132);
   textAlign(CENTER);
   text("Snowman",width/2,150);
   fill(255,158,62);
   text("Snowman",(width/2)-7,150);
   
   nya.beginTransform(18);
   lights();
 
      models[18].enableTexture();
       texture=true;
        rotateX(rotY);
   rotateY(rotX);
   models[18].draw();
   if(flag==0)
   rotX+=0.08;


   nya.endTransform();
  }

  if(nya.isExistMarker(19))
  {
  textFont(f);
   fill(255,0,0);
   textAlign(CENTER);
   text("Table",width/2,150);
   fill(0,223,0);
   text("Table",(width/2)-7,150);
   
   nya.beginTransform(19);
   lights();
 
      models[19].enableTexture();
       texture=true;
     models[19].translateToCenter();
   translate(0,0,20);
    rotateX(rotY);
   rotateY(rotX);
   models[19].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }

  if(nya.isExistMarker(20))
  {
  textFont(f);
   fill(255,106,6);
   textAlign(CENTER);
   text("Umbrella",width/2,150);
   fill(55,155,255);
   text("Umbrella",(width/2)-7,150);
   
   nya.beginTransform(20);
   lights();
 
      models[20].enableTexture();
       texture=true;
       rotateX(rotY);
   rotateY(rotX);
   models[20].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }

  if(nya.isExistMarker(21))
  {
  textFont(f);
   fill(186,24,174);
   textAlign(CENTER);
   text("Vase",width/2,150);
   fill(255,255,19);
   text("Vase",(width/2)-7,150);
   
   nya.beginTransform(21);
   lights();
 
      models[21].enableTexture();
       texture=true;
         rotateX(rotY);
   rotateY(rotX);
   models[21].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
 
  if(nya.isExistMarker(22))
  {
  textFont(f);
   fill(0,128,255);
   textAlign(CENTER);
   text("Well",width/2,150);
   fill(255,255,83);
   text("Well",(width/2)-7,150);
   
   nya.beginTransform(22);
   lights();
 
      models[22].enableTexture();
       texture=true;
      rotateX(rotY);
   rotateY(rotX);
   models[22].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
 
  if(nya.isExistMarker(23))
  {
  textFont(f);
   fill(255,51,51);
   textAlign(CENTER);
   text("X-bow",width/2,150);
   fill(255,201,14);
   text("X-bow",(width/2)-7,150);
   
   nya.beginTransform(23);
   lights();
 
      models[23].enableTexture();
       texture=true;
       rotateX(rotY);
   rotateY(rotX);
   models[23].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  
  
  if(nya.isExistMarker(24))
  {
   textFont(f);
   fill(66,0,132);
   textAlign(CENTER);
   text("Yacht",width/2,150);
   fill(255,158,62);
   text("Yacht",(width/2)-7,150);
  
   nya.beginTransform(24);
   lights();
 
      models[24].enableTexture();
       texture=true;
          rotateX(rotY);
   rotateY(rotX);
   models[24].draw();
   if(flag==0)
   rotX+=0.08;
   nya.endTransform();
  }
  

  if(nya.isExistMarker(25))
  {
  textFont(f);
   fill(255,0,0);
   textAlign(CENTER);
   text("Zombie",width/2,150);
   fill(0,223,0);
   text("Zombie",(width/2)-7,150);
   
   nya.beginTransform(25);
   lights();
 
      models[25].enableTexture();
       texture=true;
     rotateX(rotY);
   rotateY(rotX);
   models[25].draw();
   if(flag==0)
   rotX+=0.08;

   nya.endTransform();
  }
 */
   
}


