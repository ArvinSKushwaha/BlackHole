class Photon {
  PVector pos;
  PVector vel;
  float BH;
  float theta = 0;
  Photon(PVector pos_, float BH_) {
    pos = pos_;
    BH = BH_;
  }
  void update() {
    PVector force = pos.copy().mult(-1);
    float t = force.heading();
    float r = force.mag();
    float gbr = G*BH/r;
    float F_g = gbr/r;
    float dtheta = -F_g * dt/c * sin(theta - t);
    dtheta /= abs((1.0 - 2*gbr/(c2)));
    theta += dtheta;
    vel = PVector.fromAngle(theta);
    vel.setMag(c);
    pos.add(vel.copy().mult(dt));
  }
  void show() {
    point(pos.x, pos.y);
  }
}
