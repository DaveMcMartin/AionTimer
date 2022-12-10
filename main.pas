unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFormMain }

  TFormMain = class(TForm)
    ButtonStartStop: TButton;
    ButtonClear: TButton;
    LabelTime: TLabel;
    TimerClock: TTimer;
    procedure ButtonStartStopClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure TimerClockTimer(Sender: TObject);
  private
    procedure StartTimer;
    procedure StopTimer;
  public

  end;

var
  FormMain: TFormMain;
  Counter: Integer = 0;
  IsRunning: Boolean = false;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.TimerClockTimer(Sender: TObject);
var
  Minutes: Integer = 0;
  Seconds: Integer = 0;
  StrMinutes: string;
  StrSeconds: string;
begin
     Counter := Counter + 1;
     Seconds := Counter mod 60;
     Minutes := (Counter - Seconds) div 60;
     StrSeconds := IntToStr(Seconds);
     StrMinutes := IntToStr(Minutes);

     if (StrSeconds.Length = 1) then
     begin
        StrSeconds := Concat('0', StrSeconds);
     end;
     if (StrMinutes.Length = 1) then
     begin
        StrMinutes := Concat('0', StrMinutes);
     end;

     LabelTime.Caption := Concat(StrMinutes, ':', StrSeconds);
end;

procedure TFormMain.StartTimer;
begin
     IsRunning := true;
     ButtonStartStop.Caption := 'Stop';
     TimerClock.Enabled := true;
end;

procedure TFormMain.StopTimer;
begin
     IsRunning := false;
     ButtonStartStop.Caption := 'Start';
     TimerClock.Enabled := false;
end;

procedure TFormMain.ButtonStartStopClick(Sender: TObject);
begin
     if (IsRunning = false) then
     begin
        StartTimer();
     end
     else
     begin
         StopTimer();
     end;
end;

procedure TFormMain.ButtonClearClick(Sender: TObject);
begin
    if (IsRunning) then StopTimer();

    Counter := 0;
    LabelTime.Caption := '00:00';
end;

end.

