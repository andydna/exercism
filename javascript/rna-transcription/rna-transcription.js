var DnaTranscriber = function () {
};

DnaTranscriber.prototype.isInvalid = function (dna) {
  if(dna.search('X') >= 0){
    return true
  } else {
    return false;
  }
}

DnaTranscriber.prototype.toRna = function (dna) {
  if(this.isInvalid(dna)){
    throw new Error('Invalid input');
  } else {
    return dna.replace(/A/g,'U')
              .replace(/T/g,'A')
              .replace(/G/g,'X')
              .replace(/C/g,'G')
              .replace(/X/g,'C');
  }
};

module.exports = DnaTranscriber;
