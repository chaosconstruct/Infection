class Attractor{
  PVector location;
  PVector velocity;
  float mass;
  float G;
  float min;
  float max;
  float p;
  Attractor(){
      location = new PVector(width/2,height/2);
    velocity = new PVector(0.5,0);
    mass = 10;
    G = 0.1;
    min = 2;
    max = 5;
    p = 1;
  }
  
  
  PVector attract(Mover m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,min,max);
    
    force.normalize();
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
  
  
  
  void display(){
    stroke(0,90);
    //fill(100,197);
    point(location.x,location.y);//,10,10);
  }
  
  void update(){
    location = location.add(velocity);
    
    if(G>=8){
      p = -1*p;
     
    }
    else if(G<=0.05){
      p=-1*p;
      
    }
     G = G+(p*0.01);
   // mass = mass+1;
     // G = G+0.01;
    //min = min +1;
    //max = max+1;
    println(G,min,max);
  }
}