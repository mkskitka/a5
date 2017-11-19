int trial = 0;
ArrayList<Segment> segments;
ArrayList<ArrayList<Segment>> trials = new ArrayList<ArrayList<Segment>>();
float sumValues;
public class SampleChart extends Chart{

  public SampleChart(Data data, int chartX, int chartY, int chartWidth, int chartHeight){
    super(data, chartX, chartY, chartWidth, chartHeight);
    this.data = data;
    float startAngle = 0;
    float eq_theta = ((2 * PI) / data.size());
    sumValues = data.getSum();
     segments = new ArrayList<Segment>();
 
    for (int i = 0; i < data.size; i++) {
      println("data.size: ", data.size);
      float angle = (data.getDataPointValue(i) * TWO_PI)/sumValues;
      if(CHART_TYPE.equals("P")) {
        Segment s = new Segment(startAngle, angle + startAngle, data.getDataPointValue(i), data.getDataPointIsMarked(i));
        segments.add(s);
        startAngle += angle;
      }
      if(CHART_TYPE.equals("R")) {
        Segment s = new Segment(startAngle, startAngle + eq_theta, data.getDataPointValue(i), data.getDataPointIsMarked(i));
        segments.add(s);
        startAngle += eq_theta;
      }
  }
  trials.add(segments);
  trial += 1;
  println("segments.size: ", segments.size());
  }

  @Override
  public void draw(){
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(this.viewX, this.viewY, this.viewWidth, this.viewHeight);
    fill(0);

    if(CHART_TYPE.equals("B")) {
      this.name = "Bar";
      drawBars();
    }
    else if(CHART_TYPE.equals("P")) {
      this.name = "Pie";
      drawPie();
    }
    else{
      this.name = "Rose";
      drawRose();
    }
  }
  
  void drawBars() {
    for (int i = 0; i < data.size; i++) {
      fill(255);
      
      if (data.getDataPointIsMarked(i)) {
        dashed.rect(575 + 30*i, height - 400 - data.getDataPointValue(i), 20, data.getDataPointValue(i));
        dashed.offset(dist);
        dist += 1;                                                                  
      }
      else{
        rect(575 + 30*i, height - 400 - data.getDataPointValue(i), 20, data.getDataPointValue(i));
      }
      strokeWeight(1);
  }
} 
void drawPie() {
    sumValues = data.getSum();
    for (int i = 0; i < data.size(); i++) {   
       trials.get(experimentKeeper.currentTrialIndex).get(i).render();
   }
}
void drawRose() {
   for (int i = 0; i < data.size(); i++) {   
       trials.get(experimentKeeper.currentTrialIndex).get(i).render();
   }
}

}