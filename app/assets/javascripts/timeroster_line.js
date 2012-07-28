var selTabel;
var clicktest;
function etselect(){
  selTable = document.getElementById("time_roster_work_date_1i").options
  selTable[2].selected = true
}
function aaaa(){
  clicktest = document.getElementById('et-calender');
  clicktest.onClick = function(){etselect()}
}