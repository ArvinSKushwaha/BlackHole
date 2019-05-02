//import peasy.*;

double BHMass = 10000;

double G = 3.75;
double c = 30;

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
  //cam = new PeasyCam(this, 1000);
  for(int i = 0; i < photons.length; i++){
    photons[i] = new Photon(new PVector(-200,map(i,0,photons.length, 179.8, 179.9)), BHMass);
  }
}

void draw(){
  fill(0);
  translate(width/2,height/2);
  //background(0);
  stroke(255);
  ellipse(0, 0, 2*R_s, 2*R_s);
  stroke(255, 30);
  for(int n = 0; n < 10; n++){
    int i = 0;
    while(i < photons.length){
      photons[i].show();
      photons[i].update(0.01);
      if(photons[i].pos.mag() <= R_s){
        photons = remove(photons,i);
      }
      else{
        i++;
      }
    }
  }
}
