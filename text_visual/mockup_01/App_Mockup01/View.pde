void workingArea(float _posX, float _posY, float _szW, float _szH, color _color) {  
  pushMatrix();
  fill(_color);
  rect( _posX, _posY, _szW, _szH );
  popMatrix();

}

void TextTitle(String theText, float _size, color _textColor, float _posX, float _posY) { 
  pushMatrix();
  fill(_textColor);
  textSize(_size);
  text(theText, _posX, _posY);
  popMatrix();
}



