//unfinished library
//TODO Finish

class FileHandler{
  String saveFileName;
  String loadFileName;
  public FileHandler(){
  
  }
  
  public void setSaveFile(String s){
  
  }
  
  public void setLoadFile(String s){
  
  }
  
  public void saveFile(Mapper m){
    
  }
  
  public void saveFile(Mapper m, String s){
  setSaveFile(s);
  saveFile(m);
  }
  
  public void loadFile(Mapper m){
  
  }
  
  public void loadFile(Mapper m, String s){
  setLoadFile(s);
  saveFile(m);
  }
  
}
