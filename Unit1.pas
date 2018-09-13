unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    FilNm: string;
    function GetFileName(fullPath: string): string;
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
  end;

var
  Form1: TForm1;
  Tag: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
//var
//  FileName: string;
//  tmpName: string;
begin
  DragAcceptFiles(Self.Handle, True);

  Panel1.Enabled := False;
  StaticText1.Height := 60;
  //StaticText1.Color := Panel1.Color;
  //StaticText1.Font := Panel1.Font;
  StaticText1.Caption := 'Drag a picture here';

  StaticText1.Left := 3;
  StaticText1.Width := Width - 2 * StaticText1.Left-16;
  {OpenDialog1.Filter := 'Рисунок(*.jpg, *.tiff, *.tif)|*.jpg;*.tiff;*.tif';
  if OpenDialog1.Execute then
    GetFileName(OpenDialog1.FileName);

  FilNm := OpenDialog1.FileName; }

  {tmpName := ExtractFileName(OpenDialog1.FileName);

  FileName := Copy(tmpName, 0, Length(tmpName) - 4);
  Edit1.Text := FileName;

  if Length(Trim(FileName)) = 0 then
    Application.Terminate;  }
end;

function TForm1.GetFileName(fullPath: string): string;
var
  str: string;
begin
  str := ExtractFileName(fullPath);     // ExtractFileExt - расширение файла (с точкой)
  Result := Copy(str, 0, Length(str) - 4);
  StaticText1.Caption := Result;

  if Length(Trim(Result)) = 0 then
    Application.Terminate;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var
  PrevDir: string;
  CurDir: string;
begin
//  FilNm := FilNm; //OpenDialog1.FileName;
  PrevDir := Copy(FilNm, 0, Pos(ExtractFileName(FilNm), FilNm) - 1);
  CurDir := PrevDir + StaticText1.Caption;

  if not CreateDir(CurDir) then
  begin
    ShowMessage('Не могу создать папку ' + StaticText1.Caption);
    Exit;
  end;
  if not CreateDir(CurDir + '\img') then
  begin
    ShowMessage('Не могу создать папку ' + StaticText1.Caption+ '\img');
    Exit;
  end;
  if not CreateDir(CurDir + '\las') then
  begin
    ShowMessage('Не могу создать папку ' + StaticText1.Caption+ '\las');
    Exit;
  end;
  if not CreateDir(CurDir + '\wlg') then
  begin
    ShowMessage('Не могу создать папку ' + StaticText1.Caption+ '\wlg');
    Exit;
  end;

  if MoveFile(PAnsiChar(PrevDir + ExtractFileName(FilNm)), PAnsiChar(StaticText1.Caption + '\img\' + ExtractFileName(FilNm))) then
    ShowMessage('Готово!')
  else
    ShowMessage('Не могу переместить ' + ExtractFileName(FilNm) + ' из ' + PrevDir + ExtractFileName(FilNm) + ' в ' + StaticText1.Caption + '\img\' + ExtractFileName(FilNm));

  DragAcceptFiles(Handle, False);
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
  FormShow(nil);
end;

procedure TForm1.WMDropFiles(var Msg: TMessage);
var
  FileName: array[0..256] of AnsiChar;
begin
  Panel1.Enabled := True;

  DragQueryFile(THandle(Msg.WParam), 0, FileName, SizeOf(Filename));
  //GetFileName(FileName);
  GetFileName(FileName);
  FilNm := FileName;



  StaticText1.Height := 21;
  StaticText1.Font.Name := 'Times New Roman';
  StaticText1.Font.Size := 14;
  StaticText1.Left := 3;
  StaticText1.Width := Width - 2 * StaticText1.Left-16;



  DragFinish(THandle(Msg.WParam));
end;

end.


