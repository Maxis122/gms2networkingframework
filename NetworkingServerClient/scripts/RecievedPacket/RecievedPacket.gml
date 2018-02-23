///RecievedPacket(buffer, packet)

var buffer = argument0;
var socket = argument1;
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid) {
	case NETWORK_EVENT_PING: 
		Server_Event_Ping(buffer, socket);	
	break;
	
	case NETWORK_EVENT_MOVE: 
		Server_Event_Move(buffer, socket);
	break;
	
	case NETWORK_EVENT_USERNAME: 
		Server_Event_Username(buffer, socket);
	break;
	
	case NETWORK_EVENT_CHAT:
		Server_Event_Chat(buffer, socket);
	break;
	
	case NETWORK_EVENT_BULLET:
		Server_Event_Bullet(buffer, socket);
	break;
	
	case NETWORK_EVENT_HIT:
		Server_Event_Hit(buffer, socket);
	break;
	
	case NETWORK_EVENT_LOGIN:
		Server_Event_Login(buffer, socket);
	break;
	
	case NETWORK_EVENT_DEAD:
		Server_Event_Dead(buffer, socket);
	break;
}