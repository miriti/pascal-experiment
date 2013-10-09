unit game;

interface

uses
	SDL;

type
	TGame = class
		public
			constructor Create;
			procedure Run;
		private
			screen: PSDL_SURFACE;
			closeRequest: Boolean;
	end;

implementation

constructor TGame.Create;
begin
	SDL_Init(SDL_INIT_EVERYTHING);
	screen := SDL_SetVideoMode( 300, 300, 0, SDL_SWSURFACE );
	SDL_WM_SetCaption('Game', nil);
	closeRequest := false;
end;

procedure TGame.Run;
var
	event: TSDL_Event;
begin
	while not closeRequest do
	begin
		while SDL_PollEvent(@event) > 0 do
		begin

			case event.type_ of
				SDL_QUITEV:
				begin
					closeRequest := true;  
				end;

				SDL_KEYDOWN:
				begin
					case event.Key.keysym.sym of
						SDLK_ESCAPE:
							closeRequest := true;
					end;
				end;
			end;

		end;

		SDL_Flip(screen);
		SDL_Delay(16);
	end;
end;


end.
