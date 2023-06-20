unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Win.ADODB, DateUtils,
  Vcl.Imaging.pngimage;

type
  TForm5 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    ADODataSet1: TADODataSet;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    ComboBox2: TComboBox;

    Label3: TLabel;
    Label4: TLabel;
    Image22: TImage;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Image23: TImage;
    Label6: TLabel;
    Total: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ADOQuery1: TADOQuery;
    ADODataSet2: TADODataSet;
    ADODataSet3: TADODataSet;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
  var
    idClient, idvoiture, idemp: integer;

  var
    forRent: bool;
  end;

var
  Form5: TForm5;
  prix_jour, DateDiff, Ttotal: integer;

implementation

{$R *.dfm}

uses Unit8;

procedure TForm5.ADODataSet1AfterOpen(DataSet: TDataSet);
var
  i: integer;
  sqlQuery: string;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width :=
      Canvas.TextWidth(DBGrid1.Columns[i].Field.DisplayLabel) + 10;

  end;

end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  showmessage(IntToStr(idvoiture));
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.Button3Click(Sender: TObject);
var
  modelPath, facturePath, HTMLTemplate, sqlQuery: string;
  FileReader: TStreamReader;
  FileWriter: TStreamWriter;
   obj: TForm8;
begin
  modelPath := ExtractFilePath(Application.ExeName);
  modelPath := StringReplace(modelPath, 'Projet\Win32\Debug\',
    'Additionnel\Facture\model.html', [rfIgnoreCase]);
  facturePath := ExtractFilePath(Application.ExeName);
  facturePath := StringReplace(facturePath, 'Projet\Win32\Debug\',
    'Additionnel\Facture\fakkct.html', [rfIgnoreCase]);
  FileReader := TStreamReader.Create(modelPath);
  try

    HTMLTemplate := FileReader.ReadToEnd;
  finally
    FileReader.Free;
  end;
  HTMLTemplate := StringReplace(HTMLTemplate, '#clientName#', ComboBox1.Text,
    [rfReplaceAll]);
  HTMLTemplate := StringReplace(HTMLTemplate, '#TODAY#', DateToStr(Today),
    [rfReplaceAll]);
  HTMLTemplate := StringReplace(HTMLTemplate, '#DAYPRICE#', IntToStr(prix_jour),
    [rfReplaceAll]);
  HTMLTemplate := StringReplace(HTMLTemplate, '#NUMBEROFDAYS#',
    IntToStr(DateDiff), [rfReplaceAll]);
  HTMLTemplate := StringReplace(HTMLTemplate, '#MODEL#', ComboBox2.Text,
    [rfReplaceAll]);

  HTMLTemplate := StringReplace(HTMLTemplate, '#SUM#', IntToStr(Ttotal),
    [rfReplaceAll]);

  FileWriter := TStreamWriter.Create(facturePath);

  try

    FileWriter.Write(HTMLTemplate);

    FileWriter.Flush;
  finally
    FileWriter.Free;
  end;
    FileWriter.Free;
  obj.Create(nil);
obj.filePath := facturePath;
 form8.show;
  if ADODataSet3.Locate('Model', ComboBox2.Text, []) then
  begin
    ADODataSet3.Edit;
    ADODataSet3.FieldByName('Disponibilité').AsBoolean := false;
    ADODataSet3.Post;
  end;

end;

procedure TForm5.DateTimePicker2Change(Sender: TObject);
var
  Date1, Date2: TDateTime;

begin
  Date1 := DateTimePicker1.DateTime;
  Date2 := DateTimePicker2.DateTime;

  DateDiff := DaysBetween(Date2, Date1);
  Ttotal := DateDiff * prix_jour;
  Total.Caption := IntToStr(Ttotal);
end;

procedure TForm5.FormShow(Sender: TObject);
var
  sqlQuery: string;
begin

  ADODataSet3.Active := false;

  if (forRent = true) then
    sqlQuery := 'select * from Voiture where id = ' + IntToStr(idvoiture)
  else
    sqlQuery := 'select * from Voiture';

  ADODataSet3.CommandText := sqlQuery;
  ADODataSet3.Active := true;
  ADODataSet3.First;
  ComboBox2.Items.Add(ADODataSet3.FieldByName('Model').AsString);
  prix_jour := ADODataSet3.FieldByName('Prix_jour').AsInteger;

  ADODataSet2.Active := false;
  sqlQuery := 'select Nom from Client';
  ADODataSet2.Active := true;
  ADODataSet2.First;
  while not ADODataSet2.Eof do
  begin

    ComboBox1.Items.Add(ADODataSet2.FieldByName('Nom').AsString);
    ADODataSet2.Next;

  end;;

end;

end.
