var Year = function (input) {
  this.year = input;
};

Year.prototype.isLeap = function () {
  // return false;
  // return Year();
  console.log(this.year);
  if (this.year % 4 == 0){
    if (this.year % 100 == 0){
      if(this.year % 400 == 0){
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  } else {
    return false;
  }
};

module.exports = Year;
