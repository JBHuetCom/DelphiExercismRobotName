unit uRobotName;

interface

  uses
    System.Generics.Collections;

  type TRobot = class
    Name : string;
    constructor Create; Overload;
    function Reset : string;
  end;

  var
    RobotNameList : TList<string>;

implementation

  function TRobot.Reset : string;
    begin
      RobotNameList.Remove(self.Name);
      randomize;
      repeat
        self.Name := '';
        self.Name := self.Name + char(random(26) + 65);
        self.Name := self.Name + char(random(26) + 65);
        self.Name := self.Name + char(random(10) + 48);
        self.Name := self.Name + char(random(10) + 48);
        self.Name := self.Name + char(random(10) + 48);
      until not RobotNameList.Contains(self.Name);
      RobotNameList.Add(self.Name);
    end;

  constructor TRobot.Create;
    begin
      inherited;
      self.Reset;
    end;

initialization
  begin
    RobotNameList := TList<string>.Create;
  end;

finalization
  begin
    RobotNameList.Free;
  end;

end.
