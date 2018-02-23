/// @description Init the gamemode
TeamA = ds_list_create();
TeamB = ds_list_create();
ScoreA = 0;
ScoreB = 0;

if (global.GAMEMODE == GAMEMODE_CPS) {
	ControlPoints = ds_list_create();
	var ControlPointA = instance_create_depth(10, 10, 0, oServerControlPoint);
	var ControlPointB = instance_create_depth(10, 10, 0, oServerControlPoint);
	var ControlPointC = instance_create_depth(10, 10, 0, oServerControlPoint);
	ds_list_add(ControlPoints, ControlPointA, ControlPointB, ControlPointC);
}