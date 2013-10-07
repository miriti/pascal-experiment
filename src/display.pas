unit display;

interface

uses
   Windows;

type
   TDisplay = class
      class procedure Init(screenWidth, screenHeight: Integer; fullScreen: Boolean);
   end;

implementation

class procedure TDisplay.Init(screenWidth, screenHeight: Integer; fullScreen: Boolean);
begin
   MessageBox(0, 'Hello world', 'Hi! This is WinAPI application. Lol', 0);
end;

end.
