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


//テーブル作成テスト
$(function (){
	var strText = $('.ct-month-name').text();
	var strYear = strText.split("-")[0];
	var strMonth = strText.split("-")[1];
	
	var tbody = $('#list');
	var firstDate = new Date(strYear, strMonth -1, 1).getDate();
	var lastDate = new Date(strYear, strMonth, 0).getDate();
	var day_of_the_week = 0;
	var day_of_line;

	
	var strURL = "http://localhost:3000/" + strYear + "/" + strMonth + ".json";
	$.getJSON(strURL, null, function(timerosters){
		
		$.each(timerosters, function(i,timeroster){
			var workdate = timeroster.work_date;
			var goingtime = timeroster.going_work_time;
			var quittime = timeroster.quit_work_time;
		
			var temptime = Date.parse(workdate);
			var work_date = new Date();
		
			var tr = $('<tr />');
			var td = $('<td />');
			var td_date;
			var td_going;
			var td_quit;
				var i = 1;
		
			work_date.setTime(temptime);
		
		while(work_date.getDate() > i){

			td_date = $('<td class="et-days" style="text-align: center;" />').text(i + "日");
			td_going = $('<td class="et-going-work-table" />');
			td_quit = $('<td class="et-quit-work-time"/>');
			
			tr.append(td_date);
			tr.append(td_going);
			tr.append($('<td class="et-tilda" />').text("～"));
			tr.append(td_quit);

			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tbody.append(tr);
			
			tr = $('<tr />');
			i++;
		
		}
		
			td_date = $('<td class="et-days" style="text-align: center;" />').text(i + "日");
			td_going = $('<td class="et-going-work-table" />').text(goingtime);
			td_quit = $('<td class="et-quit-work-time"/>').text(quittime);
		
			tr.append(td_date);
			tr.append(td_going);
			tr.append($('<td class="et-tilda" />').text("～"));
			tr.append(td_quit);

			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tbody.append(tr);
			
		tr = $('<tr />');		
		i++;
	});
	
	while(i <= lastDate){
			td_date = $('<td class="et-days" style="text-align: center;" />').text(i + "日");
			td_going = $('<td class="et-going-work-table" />');
			td_quit = $('<td class="et-quit-work-time"/>');
		
			tr.append(td_date);
			tr.append(td_going);
			tr.append($('<td class="et-tilda" />').text("～"));
			tr.append(td_quit);

			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tr.append($('<td />'));
			tbody.append(tr);			
		tr = $('<tr />');
		i++;
	}
	alert(i);
	})
})