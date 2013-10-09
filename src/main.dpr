{$MODE DELPHI}
program main;
uses
	game in 'game.pas';
	
var
	game: TGame;
begin
	game := TGame.Create;
	game.Run;
end.
