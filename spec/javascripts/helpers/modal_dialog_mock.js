function modalDialogMock() {
  this.confirmResult;

  this.confirm = function() {
    return this.confirmResult;
  }

  this.confirmTrue = function() {
    this.confirmResult = true;
  }

  this.confirmFalse = function() {
    this.confirmResult = false;
  }
}
