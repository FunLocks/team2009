import http.requests.*;
int fl_log=0;
String uid_store;
String[] LoginUser(String name, String pass){
    PostRequest post = new PostRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/account/login");
    post.addHeader("Content-Type", "application/json");
    post.addData("{\"name\":\"" + name + "\",\"pass\":\"" + pass +"\"}");
    post.send();
    String content = post.getContent();
    //println(content);
    JSONObject response = parseJSONObject(content);
    String[] reArray = new String[3];
    reArray[0] = response.getString("name");
    reArray[1] = response.getString("pass");
    reArray[2] = response.getString("uid");
    if(reArray[2]!=null){
    fl_log=1;
    uid_store=reArray[2];
    }
    return reArray;
  }
String[] RegistUser(String name,String pass,String onlinegame,String trpg,String cardgame,String meeting,String presentation,String textchat){
  PostRequest post = new PostRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/account/register");
  post.addHeader("Content-Type", "application/json");
  post.addData("{\"name\":\"" +name+ "\",\"pass\":\"" +pass+ "\",\"onlinegame\":\"" +onlinegame+ "\",\"trpg\":\"" +trpg+ "\",\"cardgame\":\"" +cardgame+ "\",\"meeting\":\"" +meeting+ "\",\"presentation\":\"" +presentation+ "\",\"textchat\":\"" +textchat+ "\"}");
  post.send();
  String content = post.getContent();
  //println(content);
  JSONObject response = parseJSONObject(content);
  String[] reArray = new String[3];
  reArray[0] = response.getString("name");
  reArray[1] = response.getString("pass");
  reArray[2] = response.getString("uid");
  return reArray;
}
String[] RegistEvent(String name,String useruid,String title,String year,String month,String day,String hours,String minutes,String url,String text,String category){
  PostRequest post = new PostRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/event");
  post.addHeader("Content-Type", "application/json");
  post.addData("{\"name\":\"" +name+ "\",\"useruid\":\"" +useruid+ "\",\"title\":\"" +title+ "\",\"year\":\"" +year+ "\",\"month\":\"" +month+ "\",\"day\":\"" +day+ "\",\"hours\":\"" +hours+ "\",\"minutes\":\"" +minutes+ "\",\"url\":\"" +url+ "\",\"text\":\"" +text+ "\",\"category\":\"" +category+"\"}");
  post.send();
  String content = post.getContent();
  //println(content);
  JSONObject response = parseJSONObject(content);
  String[] reArray = new String[12];
  reArray[0] = response.getString("category");
  reArray[1] = response.getString("maker");
  reArray[2] = String.valueOf(response.getInt("participant"));
  reArray[3] = response.getString("text");
  reArray[4] = response.getString("title");
  reArray[5] = response.getString("uid");
  reArray[6] = response.getString("url");
  reArray[7] = String.valueOf(response.getInt("year"));
  reArray[8] = String.valueOf(response.getString("month"));
  reArray[9] = String.valueOf(response.getString("day"));
  reArray[10] = String.valueOf(response.getString("hours"));
  reArray[11] = String.valueOf(response.getString("minutes"));
  return reArray;
  
}
String JoinEvent(String eventuid,String useruid){
  PostRequest post = new PostRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/event/join");
  post.addHeader("Content-Type", "application/json");
  post.addData("{\"eventuid\":\"" + eventuid + "\",\"useruid\":\"" + useruid +"\"}");
  post.send();
  return post.getContent();
}
  
ArrayList<String[]> SearchEvent(String text){
  GetRequest get = new GetRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/event/search?text=" + text);
  get.send();
  //println(get.getContent());
  JSONArray response = parseJSONArray(get.getContent());
  int resSize = response.size();
  ArrayList<String[]> list = new ArrayList<String[]>();
  for(int i = 0;i < resSize;i++){
    JSONObject iJObject = response.getJSONObject(i);
    String[] iArray = new String[12];
    iArray[0] = iJObject.getString("category");
    iArray[1] = iJObject.getString("maker");
    iArray[2] = String.valueOf(iJObject.getInt("participant"));
    iArray[3] = iJObject.getString("text");
    iArray[4] = iJObject.getString("title");
    iArray[5] = iJObject.getString("uid");
    iArray[6] = iJObject.getString("url");
    iArray[7] = String.valueOf(iJObject.getInt("year"));
    iArray[8] = String.valueOf(iJObject.getString("month"));
    iArray[9] = String.valueOf(iJObject.getString("day"));
    iArray[10] = String.valueOf(iJObject.getString("hours"));
    iArray[11] = String.valueOf(iJObject.getString("minutes"));
    list.add(iArray);
  }
  return list;
}

String[] GetEvent(String eventuid){
  GetRequest get = new GetRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/event/?eventuid=" + eventuid);
  get.send();
  //println(get.getContent());
  JSONObject response = parseJSONObject(get.getContent());
  String[] reArray = new String[12];
  reArray[0] = response.getString("category");
  reArray[1] = response.getString("maker");
  reArray[2] = String.valueOf(response.getInt("participant"));
  reArray[3] = response.getString("text");
  reArray[4] = response.getString("title");
  reArray[5] = response.getString("uid");
  reArray[6] = response.getString("url");
  reArray[7] = String.valueOf(response.getInt("year"));
  reArray[8] = String.valueOf(response.getString("month"));
  reArray[9] = String.valueOf(response.getString("day"));
  reArray[10] = String.valueOf(response.getString("hours"));
  reArray[11] = String.valueOf(response.getString("minutes"));
  return reArray;
}

ArrayList<String[]> RecommendEvent(String useruid, String eventnum){
  GetRequest get = new GetRequest("https://us-central1-abcd-78830.cloudfunctions.net/app/event/recommend/?useruid=" + useruid + "&eventnum=" + eventnum);
  get.send();
  //println(get.getContent());
  JSONArray response = parseJSONArray(get.getContent());
  int resSize = response.size();
  ArrayList<String[]> list = new ArrayList<String[]>();
  for(int i = 0;i < resSize;i++){
    JSONObject iJObject = response.getJSONObject(i);
    String[] iArray = new String[12];
    iArray[0] = iJObject.getString("category");
    iArray[1] = iJObject.getString("maker");
    iArray[2] = String.valueOf(iJObject.getInt("participant"));
    iArray[3] = iJObject.getString("text");
    iArray[4] = iJObject.getString("title");
    iArray[5] = iJObject.getString("uid");
    iArray[6] = iJObject.getString("url");
    iArray[7] = String.valueOf(iJObject.getInt("year"));
    iArray[8] = String.valueOf(iJObject.getString("month"));
    iArray[9] = String.valueOf(iJObject.getString("day"));
    iArray[10] = String.valueOf(iJObject.getString("hours"));
    iArray[11] = String.valueOf(iJObject.getString("minutes"));
    list.add(iArray);
  }
  return list;
}


//テスト用
void Abema(){
  GetRequest get = new GetRequest("https://us-central1-abcd-78830.cloudfunctions.net/app?username=jaja");
  get.send(); // program will wait untill the request is completed
  String g = get.getContent();
  println(g);
  println("response: " + get.getContent());
}
