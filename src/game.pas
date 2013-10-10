unit game;

interface

uses
	SDL, render;

const
	SCREEN_WIDTH:Integer = 400;
	SCREEN_HEIGHT:Integer = 400;
	WND_TITLE:PChar = 'Circles';

type
	TGame = class
		public
			constructor Create;
			procedure Run;
		private
			rootList: TDisplayObjectContainer;
			screen: PSDL_SURFACE;
			closeRequest: Boolean;
	end;

implementation

{*
 * Initialize everything about the game	
 *}
constructor TGame.Create;
begin
	SDL_putenv('SDL_VIDEO_WINDOW_POS=center');
	SDL_Init(SDL_INIT_EVERYTHING);
	screen := SDL_SetVideoMode(SCREEN_WIDTH, SCREEN_HEIGHT, 32, SDL_HWSURFACE or SDL_DOUBLEBUF);
	SDL_WM_SetCaption(WND_TITLE, nil);

	closeRequest := false;

	rootList := TDisplayObjectContainer.Create;
end;

{*
 * Run the game	
 *}
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

		rootList.Update(16);
		rootList.Render;

		SDL_Flip(screen);
		SDL_Delay(16);
	end;
end;


end.
