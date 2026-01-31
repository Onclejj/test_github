void main(){
  Map<String ,int> notes={
    "math":15,
    "informatique":12,
    "geogrphie":10,
    "Anglais":60
  };
  print (notes);
  print (notes["math"]);
  notes.forEach((key,value){
    print("$key:$value");
  });
}