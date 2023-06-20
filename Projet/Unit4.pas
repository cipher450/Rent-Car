unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Data.Win.ADODB,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.IOUtils;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    Ajouter: TTabSheet;
    Liste: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    GroupBox1: TGroupBox;
    Image7: TImage;
    DBGrid2: TDBGrid;
    OpenDialog1: TOpenDialog;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Image8: TImage;
    procedure Image7Click(Sender: TObject);
    procedure ADODataSet1AfterPost(DataSet: TDataSet);
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form4: TForm4;
    var Srcpath :string;
  var TotalClients:integer;
implementation

{$R *.dfm}

procedure TForm4.ADODataSet1AfterOpen(DataSet: TDataSet);
var
  i: Integer;

begin
    for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width := Canvas.TextWidth(DBGrid1.Columns[i].Field.DisplayLabel) + 10;

  end;
end;

procedure TForm4.ADODataSet1AfterPost(DataSet: TDataSet);
var
  id: integer;
var
   DestPath: string;
begin



  id := DBNavigator1.DataSource.DataSet.FieldByName('ID').AsInteger;
  DestPath := ExtractFilePath(Application.ExeName);
  DestPath := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Client\' + IntToStr(id) + '.png', [rfIgnoreCase]);
  if Not Tfile.Exists(DestPath) then
       TFile.Copy(Srcpath,DestPath) ;

end;

procedure TForm4.ADODataSet1AfterScroll(DataSet: TDataSet);
var cur_client,sql_query :string;
begin
    cur_client:=DBNavigator1.DataSource.DataSet.FieldByName('ID').AsString;
    if not (cur_client='') then
    begin
       sql_query:='select * from Contrat where Id_Client = '+cur_client;
      ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Insert(0,sql_query);
    ADOQuery1.Active:=true;
    end;
end;

procedure TForm4.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
    TotalClients := ADODataSet1.FieldCount;
end;

procedure TForm4.ADOQuery1BeforeInsert(DataSet: TDataSet);
var cur_client  :integer;
begin
    DBNavigator1.DataSource.DataSet.FieldCount;
  DBNavigator1.DataSource.DataSet.FieldByName('ID').AsInteger := TotalClients + 1;
end;

procedure TForm4.Image7Click(Sender: TObject);
begin
  OpenDialog1.Create(self);
  OpenDialog1.Filter := 'Image files |*.png';
  if OpenDialog1.Execute then
  begin
  Srcpath :=  OpenDialog1.Files[0];
    Image7.Picture.LoadFromFile(OpenDialog1.Files[0]);
  end;

end;

end.
