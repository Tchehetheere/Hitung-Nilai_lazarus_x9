unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDBLib, SQLDB, mysql80conn, mysql57conn, mysql40conn,
  mysql56conn, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  ExtCtrls;

type

  { TTmain }

  TTmain = class(TForm)
    btn_hitungNilai: TButton;
    edt_nama: TEdit;
    edt_nilai: TEdit;
    lbl_dt_nama: TLabel;
    lbl_dt_nilai: TLabel;
    lbl_grade_value: TLabel;
    lbl_status_value: TLabel;
    lbl_grade: TLabel;
    lbl_status: TLabel;
    lbl_nama: TLabel;
    lbl_nilai: TLabel;
    Panel1: TPanel;
    procedure btn_hitungNilaiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl_status_valueClick(Sender: TObject);
    procedure SQLConnector1AfterConnect(Sender: TObject);
  private

    nama: String;
    nilai: String;
    status: String;
    grade: String;

  public

  end;

var
  Tmain: TTmain;

implementation

{$R *.lfm}

{ TTmain }

procedure TTmain.FormCreate(Sender: TObject);
begin

end;

procedure TTmain.lbl_status_valueClick(Sender: TObject);
begin

end;


function cariGrade(Anilai: String):String;
var
  nilai: real;
begin

  nilai:= StrToFloat(Anilai);

  if (nilai >= 85 ) AND (nilai <= 100) then
     result:= 'A'
  else if (nilai >= 75) AND (nilai < 85) then
     result:= 'B'
  else if (nilai >= 60) AND (nilai < 75) then
     result:= 'C'
  else if (nilai >= 45) AND (nilai < 60) then
     result:= 'D'
  else if (nilai >= 0) AND (nilai < 45) then
     result:= 'E'
  else
      result:= 'Invalid';

  cariGrade:= result;

end;

function cariStatus(Anilai: String): String;
var
  nilai: Real;
begin

  nilai:= StrToFloat(Anilai);

  if (nilai >= 70) AND (nilai <= 100) then
     result:= 'LULUS'
  else if (nilai >= 0) AND (nilai <= 69.99) then
      result:= 'TIDAK LULUS'
  else
      result:= 'Invalid';

  cariStatus:= result;

end;

function cariWarnaGrade(Agrade: String): String;
begin

  case Agrade of
    'A', 'B':  result:= 'clLime';
    'C', 'D': result:= 'clYellow';
  else result:= 'clRed';
  end;

  cariWarnaGrade:= result;

end;

function cariWarnaStatus(Astatus: String): String;
begin

  if (Astatus = 'LULUS') then
      result:= 'clLime'
  else if (Astatus = 'TIDAK LULUS') then
       result:= 'clRed'
  else
      result:= 'clRed';

  cariWarnaStatus:= result;

end;

procedure TTmain.btn_hitungNilaiClick(Sender: TObject);
var
  warnaGrade, warnaStatus: String;
begin


  nama:= edt_nama.Text;
  nilai:= edt_nilai.Text;
  grade:= cariGrade(nilai);
  warnaGrade:= cariWarnaGrade(grade);
  status:= cariStatus(nilai);
  warnaStatus:= cariWarnaStatus(status);


  lbl_dt_nama.Caption:= 'Nama: ' + nama;
  lbl_dt_nilai.Caption:= 'Nilai: ' + nilai;

  lbl_status_value.Caption:= status;
  lbl_status_value.Font.Color:= StringToColor(warnaStatus);
  lbl_grade_value.Caption:= grade;
  lbl_grade_value.Font.Color:= StringToColor(warnaGrade);



end;

procedure TTmain.SQLConnector1AfterConnect(Sender: TObject);
begin

end;

end.

