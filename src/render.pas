unit render;

interface

uses
	SDL;

const
	SCREEN_WIDTH:Integer = 400;
	SCREEN_HEIGHT:Integer = 400;

type
	TDisplayObject = class
		public
			procedure Update(DeltaTime: Integer); virtual;
			procedure Render(Surface: PSDL_SURFACE); virtual;
	end;

	TDisplayObjectContainer = class (TDisplayObject)
		private
			Children: array of TDisplayObject;
		public
			procedure Update(DeltaTime: Integer); override;
			procedure Render(Surface: PSDL_SURFACE); override;
			procedure AddChild(Child: TDisplayObject);
			procedure RemoveChild(Child: TDisplayObject);
	end;

	TPixels = array[0..399, 0..399] of Cardinal;

implementation

{* TDisplayObject *}
procedure TDisplayObject.Update;
begin
	
end;

procedure TDisplayObject.Render;
begin
	
end;

{* TDisplayObjectContainer *}

procedure TDisplayObjectContainer.Update;
var
	i: Integer;
begin
	for i := 0 to Length(Children) - 1 do 
	begin
		Children[i].Update(DeltaTime);
	end;
end;

procedure TDisplayObjectContainer.Render;
var
	i:Integer;
begin
	for i := 0 to Length(Children) - 1 do
	begin
		Children[i].Render(Surface);
	end;
end;

procedure TDisplayObjectContainer.AddChild;
begin
	SetLength(Children, Length(Children) + 1);
	Children[Length(Children) - 1] := Child;
end;

procedure TDisplayObjectContainer.RemoveChild;
begin
	
end;

end.
