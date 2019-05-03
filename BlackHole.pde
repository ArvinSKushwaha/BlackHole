//import peasy.*;
float dt = 0.01;
float BHMass = 10000;

float G = 3.75;
float c = 30;
float c2 = c*c; 

float R_s = (float)(2*BHMass*G/(c*c));

Photon[] remove(Photon[] arr, int index){
  Photon[] out = new Photon[arr.length - 1];
  int n = 0;
  for(int i = 0; i < arr.length; i++){
    if(i != index){
      out[n] = arr[i];
      n++;
    }
  }
  return out;
}

Photon[] photons = new Photon[1000];
//PeasyCam cam;
void setup(){
  fullScreen(P2D);
  background(0);
  fill(0);
  stroke(255,30);
  translate(width/2,height/2);
  ellipse(0, 0, 3*R_s, 3*R_s);
  ellipse(0, 0, 2*R_s, 2*R_s);
  //cam = new PeasyCam(this, 1000);
  for(int i = 0; i < photons.length; i++){
    photons[i] = new Photon(new PVector(-1000, R_s * 2.67 + (i-photons.length/2.0)/10.0), BHMass);
  }
}

void draw(){
  translate(width/2,height/2);
  //background(0);
  for(int n = 0; n < 10; n++){
    int i = 0;
    while(i < photons.length){
      photons[i].update();
      if(photons[i].pos.mag() <= R_s){
        photons = remove(photons,i);
      }
      else{
        i++;
      }
    }
  }
  for(int i = 0; i < photons.length; i++){
    photons[i].show();
  }
}
void mousePressed(){
  save("img.jpg");
}
