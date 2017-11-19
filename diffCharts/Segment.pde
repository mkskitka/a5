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
    fill(255);
        
    stroke(color(0));
    
    if(CHART_TYPE.equals("P")) {  
      arc(width / 2, height / 2 - 90, width / 7, width / 7, this.startAngle, this.stopAngle, PIE);
    }
    if(CHART_TYPE.equals("R")) {
      arc(width / 2, height / 2 - 90, this.value*2.5, this.value*2.5, this.startAngle, this.stopAngle, PIE);
    }
    
    if (this.marked && indep_var.equals("animate")) {
      if(CHART_TYPE.equals("P")) {  
          strokeWeight(0);
          arc(width / 2, height / 2 - 90, width / 7, width / 7, this.startAngle, this.stopAngle, PIE);
          strokeWeight(2);
          dashed.arc(width / 2, height / 2 - 90, width / 7, width / 7, this.startAngle, this.stopAngle, PIE);
          dashed.offset(dist);
          dist += 1;
      }
      if(CHART_TYPE.equals("R")) {
          strokeWeight(0);
          arc(width / 2, height / 2 - 90, this.value*2.5, this.value *2.5, this.startAngle, this.stopAngle, PIE);
          strokeWeight(2);
          dashed.arc(width / 2, height / 2 - 90, this.value*2.5, this.value *2.5, this.startAngle, this.stopAngle, PIE);
          dashed.offset(dist);
          dist += 1;
      }
    }
      
    fill(#ff0000);
    strokeWeight(1);
  }   
  
}