class Segment{
  private int x, y, value;
  private float w, h, startAngle, stopAngle;
  private boolean marked;
  
  Segment(float startAngle, float stopAngle, float value, boolean isMarked) {
      this.startAngle = startAngle;
      this.stopAngle = stopAngle;
      this.marked = isMarked;
      this.value = int(value);  
  }
  
  void render() {
    fill(#ff0000);
        
    stroke(color(0));
    
    if(CHART_TYPE.equals("P")) {  
      arc(width / 2, height / 2 - 90, width / 7, width / 7, this.startAngle, this.stopAngle, PIE);
    }
    if(CHART_TYPE.equals("R")) {
      arc(width / 2, height / 2 - 90, this.value*2.5, this.value*2.5, this.startAngle, this.stopAngle, PIE);
    }
    
    if (this.marked) {
      //println("marked?: ", this.marked, "str: ", this.startAngle, " end: ", this.stopAngle);
      float angleDiff = this.stopAngle - this.startAngle;
      //println("radius: ", (float)width/7, " sa: ", this.startAngle, " ea: ", this.stopAngle);
      //float x = (float)width/25 * cos(this.startAngle + angleDiff/2);
      //float y = (float)width/25 * sin(this.startAngle + angleDiff/2);
      strokeWeight(5);
      if(CHART_TYPE.equals("P")) {  
          arc(width / 2, height / 2 - 90, width / 7, width / 7, this.startAngle, this.stopAngle, PIE);
      }
      if(CHART_TYPE.equals("R")) {
          arc(width / 2, height / 2 - 90, this.value*2.5, this.value *2.5, this.startAngle, this.stopAngle, PIE);
      }
    }
    fill(#ff0000);
    strokeWeight(1);
  }
  
}