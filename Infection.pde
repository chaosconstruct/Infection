int k = 1000;

Attractor a;
Mover[] m = new Mover[k];
PVector l;
float [] px = new float [k];
float [] py = new float [k];
void setup(){
  //size(800,500);
  fullScreen(JAVA2D);
  background(255);
  a = new Attractor();
  for(int i =0; i<m.length;i++){
  l  = new PVector(random(-0.5,0.5),random(-0.5,0.5));
  m[i] = new Mover(width/2,height/2,l,random(100));
  px[i] = m[i].location.x;
  py[i] = m[i].location.y;
  }
  smooth(4);
  
}

void draw(){
  for(int i = 0; i<m.length;i++){
  PVector force = a.attract(m[i]);
  m[i].applyForce(force);
  m[i].update();
 

  m[i].display();
  beginShape();
  vertex(m[i].location.x,m[i].location.y);
  vertex(px[i],py[i]);
  endShape();
  px[i] = m[i].location.x;
  py[i] = m[i].location.y;
  }
   a.update();
   //a.display();
   //saveFrame("fly-####.png");
}