#include <client_ftp.h>

int main(int argc, char* argv[])
{
	//BEGIN: initialization
	struct sockaddr_in sin_server;
	int sfd_client, x;
	size_t size_sockaddr = sizeof(struct sockaddr), size_packet = sizeof(struct packet);
	short int connection_id;
	struct packet* chp = (struct packet*) malloc(size_packet);		// client host packet
	set0(chp);
	struct packet* data;							// network packet
	
	if((x = sfd_client = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
		er("socket()", x);
	
	memset((char*) &sin_server, 0, sizeof(struct sockaddr_in));
	sin_server.sin_family = AF_INET;
	sin_server.sin_addr.s_addr = inet_addr(IPSERVER);
	sin_server.sin_port = htons(PORTSERVER);
	
	if((x = connect(sfd_client, (struct sockaddr*) &sin_server, size_sockaddr)) < 0)
		er("connect()", x);
			
	printf(ID "FTP Client started up. Attempting communication with server @ %s:%d...\n\n", IPSERVER, PORTSERVER);
	//END: initialization

	
	struct command* cmd;
	char lpwd[LENBUFFER], pwd[LENBUFFER];
	char userinput[LENUSERINPUT];
	while(1)
	{
		printf("\t> ");
		fgets(userinput, LENUSERINPUT, stdin);	// in order to give \
					a filename with spaces, put ':' \
					instead of ' '. If a command needs \
					x paths, and y (y > x) paths are \
					provided, y - x paths will be \
					ignored.
		cmd = userinputtocommand(userinput);
		if(!cmd)
			continue;
		//printcommand(cmd);
		switch(cmd->id)
		{
			case GET:
				if(cmd->npaths)
					command_get(chp, data, sfd_client, *cmd->paths);
				else
					fprintf(stderr, "No path to file given.\n");
				break;
			case PUT:
				if(cmd->npaths)
					command_put(chp, data, sfd_client, *cmd->paths);
				else
					fprintf(stderr, "No path to file given.\n");
				break;
			case CD:
				if(cmd->npaths)
					command_cd(chp, data, sfd_client, *cmd->paths);
				else
					fprintf(stderr, "No path given.\n");
				break;
			case LS:
				command_ls(chp, data, sfd_client);
				break;
			default:
				// display error
				break;
		}
	}
	//outside_client_command_loop:
	
	close(sfd_client);
	printf(ID "Done.\n");
	fflush(stdout);
	
	return 0;
}

