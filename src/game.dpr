{$MODE DELPHI}
program game;
uses
   display in 'display.pas';
	
begin
   TDisplay.Init(1024, 768, PChar('The Game'), false);

   while not TDisplay.isCloseRequested() do
   begin
      TDisplay.Update();
   end;
end.
