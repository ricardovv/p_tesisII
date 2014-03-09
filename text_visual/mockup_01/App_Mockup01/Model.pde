

//Sums number of Chapters form the Array articlesOnChapter
//Receives input form lenghtEachArticleOnChapter
float articlesOnChapterTotal( float _val) {  
 _val = 0;
  for (  int i=0; i< articlesOnChapter.length;   i++  ) {
    _val += articlesOnChapter[i];
  }
  return _val;
}//END articlesOnChapterTotal



//Reads values for each Chapter array
//Sends it to articlesOnChapterTotal 
float lenghtEachArticleOnChapter() {
  float _val = 0;
  
  for (int i=0; i<articlesOnChapter.length; i++) {
    _val = articlesOnChapterTotal(i);
    fill(0);
//    text("arrayTot = " + articlesOnChapterTotal(i), mouseX, mouseY );
  }
    return _val;

}
