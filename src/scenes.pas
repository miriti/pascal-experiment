unit scenes;

interface

uses
	SDL, render;

type
	TGameMainScene = class (TDisplayObjectContainer)
	public
		constructor Create;
		procedure Update(DeltaTime: Integer); override;
		procedure Render(Surface: PSDL_Surface); override;
	end;

implementation

{*
 * TGameMainScene	
 *}

constructor TGameMainScene.Create;
begin
	
end;

procedure TGameMainScene.Update;
begin
	
end;

procedure TGameMainScene.Render;
var
	i,j: Cardinal;
begin
	for i := 0 to Surface.w - 1 do
	begin
		for j := 0 to Surface.h - 1 do
		begin
			TPixels(Surface.pixels^)[i, j] := Random($FFFFFF);
		end;
	end;
end;

end.
