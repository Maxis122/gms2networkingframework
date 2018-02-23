///cRecievedPacket(buffer)

var buffer = argument0;
var msgid = buffer_read(buffer, buffer_u8);

if (ClientConnected) {
	switch(msgid) {
		case NETWORK_EVENT_PING: 
			Client_Event_Ping(buffer);
		break;
	
		case NETWORK_EVENT_MOVE: 
			Client_Event_Move(buffer);		
		break;
	
		case NETWORK_EVENT_DISCONNECT: 						   
			Client_Event_Disconnect(buffer);
		break;
	
		case NETWORK_EVENT_USERNAME:
			Client_Event_Username(buffer);
		break;
	
		case NETWORK_EVENT_CHAT:
			Client_Event_Chat(buffer);
		break;
	
		case NETWORK_EVENT_BULLET:
			Client_Event_Bullet(buffer);
		break;
	
		case NETWORK_EVENT_HIT:
			Client_Event_Hit(buffer);
		break;
		
		case NETWORK_EVENT_DEAD:
			Client_Event_Dead(buffer);
		break;
		
		case NETWORK_EVENT_GAMEOVER:
			Client_Event_GameOver(buffer);
		break;
		
		case NETWORK_EVENT_GAMERESET:
			Client_Event_GameReset(buffer);
		break;
	}
} else {
	if (msgid == NETWORK_EVENT_LOGIN) {
		Client_Event_Login(buffer);
	}
}