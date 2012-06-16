$(function () {
	$('#time_roster_going_work_time').timeEntry({show24Hours: true, timeSteps: [1, 15, 0]});
	$('#time_roster_quit_work_time').timeEntry({show24Hours: true, timeSteps: [1, 15, 0]});
	$('#defaultEntry').timeEntry({show24Hours: true, timeSteps: [1, 15, 0]});
});
