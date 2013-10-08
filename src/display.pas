unit display;

interface

uses
   Windows, SDL;

type
   TDisplay = class
      private
         class var screen : PSDL_SURFACE;
         class var closeRequest: Boolean;
      public
         class procedure Init(screenWidth, screenHeight: Integer; fullScreen: Boolean);
         class procedure Update();
         class function isCloseRequested():Boolean;
   end;

implementation

{*
 * Init display
 *}
class procedure TDisplay.Init(screenWidth, screenHeight: Integer; fullScreen: Boolean);
begin
   SDL_Init(SDL_INIT_EVERYTHING);
   screen := SDL_SetVideoMode( 800, 600, 0, SDL_SWSURFACE );
   closeRequest := false;
end;

{*
 * Update display
 *}
class procedure TDisplay.Update();
var
   event: TSDL_Event;
begin
   while SDL_PollEvent(@event) > 0 do
   begin
      case event.type_ of
        SDL_KEYDOWN:
        begin
          case event.Key.keysym.sym of                     
            SDLK_ESCAPE :
              closeRequest := true;
          end;
        end;
      end;
    end;

   SDL_Flip(screen);
   SDL_Delay(16);
end;

{*
 * Returns `true` is user pressed Esc since last update
 *}
class function TDisplay.isCloseRequested():Boolean;
begin
   Result := closeRequest;
end;

end.
