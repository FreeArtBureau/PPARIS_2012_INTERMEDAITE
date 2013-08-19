class Timer
{
  float t;
  float now;
  Timer()
  {
    t = millis();
  }
  float getDeltaMS()
  {
    now = millis();
    float dt = now - t;
    t = now;
    return dt;
  }

  float getDeltaS()
  {
    return getDeltaMS()/1000.0;
  }

};
