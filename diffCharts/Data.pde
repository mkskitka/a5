public class Data{

  private int size;
  private DataPoint[] dataPoints;

  public Data(int size){
    this.size = size;
    this.dataPoints = new DataPoint[size];

    //ToDo: how to generate data points and mark two of the data points
  }

  //ToDo: feel free to add variables and methods for your convenience


  public int size(){
    return this.size;
  }

  public void setDataPoint(int index, float value, boolean isMarked) {
    this.dataPoints[index] = new DataPoint(value, isMarked);
  }
  
  public float getDataPointValue(int index) {
    return this.dataPoints[index].getValue();
  }
  
  public boolean getDataPointIsMarked(int index) {
    return this.dataPoints[index].isMarked();
  }
  
  public void print() {
    println("In data print func");
    println("DataPoints array length: " + this.dataPoints.length);
    for (DataPoint p : this.dataPoints) {
       println("Value: " + p.getValue() +"\nisMarked: " + p.isMarked()); 
    }
  }
  
  public float getSum() {
    float sum = 0;
    for (DataPoint p : this.dataPoints) {
       sum += p.getValue();; 
    }
    return sum;
  }
  public float getMin() {
    float min = 100;
    for (DataPoint p : this.dataPoints) {
      if (p.isMarked() && p.getValue() < min)
       min = p.getValue();
    }
    return min;
  }
  
  public float getMax() {
    float max = 0;
    for (DataPoint p : this.dataPoints) {
      if (p.isMarked() && p.getValue() > max)
       max = p.getValue(); 
    }
    return max;
  }
  private class DataPoint{
    private float value;;
    private boolean isMarked;

    public DataPoint(float value, boolean isMarked){
      this.value = value;
      this.isMarked = isMarked;
    }

    public boolean isMarked(){
      return this.isMarked;
    }

    public float getValue(){
      return this.value;
    }

  }

}