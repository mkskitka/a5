int trial = 0;
ArrayList<Segment> segments;
ArrayList<ArrayList<Segment>> trials = new ArrayList<ArrayList<Segment>>();
float sumValues;
public class SampleChart extends Chart{

  public SampleChart(Data data, int chartX, int chartY, int chartWidth, int chartHeight){
    super(data, chartX, chartY, chartWidth, chartHeight);
    this.name = "sample";
    this.data = data;
    float startAngle = 0;
    sumValues = data.getSum();
     segments = new ArrayList<Segment>();
    for (int i = 0; i < data.size; i++) {
      println("data.size: ", data.size);
      float angle = (data.getDataPointValue(i) * TWO_PI)/sumValues;
      Segment s = new Segment(startAngle, angle + startAngle, data.getDataPointValue(i), data.getDataPointIsMarked(i));
      segments.add(s);
      startAngle += angle;
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

    //drawBars();
    drawPie();
  }
  
  void drawBars() {
    for (int i = 0; i < data.size; i++) {
      fill(#ff0000);
      rect(575 + 30*i, height - 400 - data.getDataPointValue(i), 20, data.getDataPointValue(i));
      if (data.getDataPointIsMarked(i)) {
        strokeWeight(3);
        rect(575 + 30*i, height - 400 - data.getDataPointValue(i), 20, data.getDataPointValue(i));
        //point(575 + 30*i + 10, height - 400 - data.getDataPointValue(i)/2); //CENTERING 
                                                                            
      }
      strokeWeight(1);
  }
} 
void drawPie() {
    float startAngle = 0;
    sumValues = data.getSum();
    for (int i = 0; i < data.size(); i++) {   
       trials.get(experimentKeeper.currentTrialIndex).get(i).render();
   }
}
}