class Photon{
  PVector pos;
  PVector vel;
  double BH;
  float theta = 0;
  Photon(PVector pos_, double BH_){
    pos = pos_;
    BH = BH_;
  }
  void update(float dt){
    PVector force = pos.copy().mult(-1);
    float t = force.heading();
    float r = force.mag();
    float F_g = (float) (G*BHMass/(r*r));
    float dtheta = -F_g * (float) (dt/c) * sin(theta - t);
    dtheta /= abs((float)(1.0 - G*2*BH/(r*c*c)));
    theta += dtheta;
    vel = PVector.fromAngle(theta);
    vel.setMag((float)c);
    pos.add(vel.copy().mult(dt));
  }
  void show(){
    point(pos.x, pos.y);
  }
}
