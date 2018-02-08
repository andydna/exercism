var TwoFer = function () {};

TwoFer.prototype.twoFer = function (who) {
  if(who){
    who = `One for ${who}, one for me.`
  }
  else {
    who = 'One for you, one for me.'
  }
  return who;
};

module.exports = TwoFer;
