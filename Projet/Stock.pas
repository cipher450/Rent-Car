unit Stock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtDlgs, System.IOUtils;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Image10: TImage;
    Image11: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image7: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Image1: TImage;
    ColorBox1: TColorBox;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Image12: TImage;
    Image13: TImage;
    Label8: TLabel;
    Label11: TLabel;
    Image14: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    ADOTable1: TADOTable;
    OpenDialog1: TOpenDialog;
    Filtre: TGroupBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    Label9: TLabel;
    Image8: TImage;
    DBEdit9: TDBEdit;
    Label18: TLabel;
    Image15: TImage;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    louera: TLabel;
    Label20: TLabel;
    Image6: TImage;
    id_contrat: TLabel;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure ColorBox1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ADODataSet1BeforeInsert(DataSet: TDataSet);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form3: TForm3;
  SrcPath: string;

implementation

{$R *.dfm}

procedure TForm3.ADODataSet1AfterOpen(DataSet: TDataSet);

var
  i: Integer;

begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width :=
      Canvas.TextWidth(DBGrid1.Columns[i].Field.DisplayLabel) + 10;

  end;
end;

procedure TForm3.ADODataSet1AfterScroll(DataSet: TDataSet);
var
  stringColor, DestPath, NotFound: String;
var
  id, idClient: Integer;

begin

  stringColor := DBNavigator1.DataSource.DataSet.FieldByName('Couleur')
    .AsString;
  if not(stringColor = '') then
    ColorBox1.Selected := StringToColor(stringColor);

  id := DBNavigator1.DataSource.DataSet.FieldByName('ID').AsInteger;
  DestPath := ExtractFilePath(Application.ExeName);
  NotFound := ExtractFilePath(Application.ExeName);
  NotFound := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Cars\404.png', [rfIgnoreCase]);
  DestPath := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Cars\' + IntToStr(id) + '.png', [rfIgnoreCase]);
  if TFile.Exists(DestPath) then
    Image1.Picture.LoadFromFile(DestPath)
  else
    Image1.Picture.LoadFromFile(NotFound);

  // Voir si la voiture a etais louer ou non
  ADOQuery1.SQL.Text := 'SELECT * FROM contrat WHERE VehiculeID = ' +
    IntToStr(id);
  ADOQuery1.Open;

  if ADOQuery1.IsEmpty then
    GroupBox1.Visible := False
  else
  begin
    GroupBox1.Visible := True;
    id_contrat.Caption := ADOQuery1.FieldByName('ID_Contrat').AsString;
    Edit1.Text := ADOQuery1.FieldByName('Debut_Contrat').AsString;
    Edit2.Text := ADOQuery1.FieldByName('Fin_Contrat').AsString;
    idClient := ADOQuery1.FieldByName('Id_Client').AsInteger;


    ADOQuery1.Next;
    ADOQuery1.Close;

    ADOQuery1.SQL.Text := 'SELECT Nom FROM Client WHERE ID = ' + IntToStr(idClient);
    ADOQuery1.Open;
    louera.Caption:= ADOQuery1.FieldByName('Nom').AsString;
      ADOQuery1.Close;





  end;



end;

procedure TForm3.ADODataSet1BeforeInsert(DataSet: TDataSet);
var
  DestPath: string;
  i, id, RowCount: Integer;

begin

  id := DBNavigator1.DataSource.DataSet.FieldByName('ID').AsInteger;
  DestPath := ExtractFilePath(Application.ExeName);
  DestPath := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Client\' + IntToStr(id) + '.png', [rfIgnoreCase]);
  if Not TFile.Exists(DestPath) then
  begin
    if TFile.Exists(SrcPath) then
      TFile.Copy(SrcPath, DestPath);
  end;
end;

procedure TForm3.ColorBox1Change(Sender: TObject);
begin
  ADOTable1.DataSource.DataSet.Edit;
  ADOTable1.DataSource.DataSet.FieldByName('Couleur').AsString :=
    ColorToString(ColorBox1.Selected);
  ADOTable1.DataSource.DataSet.Post;
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  OpenDialog1.Create(self);
  OpenDialog1.Filter := 'Image files |*.png';
  if OpenDialog1.Execute then
  begin
    SrcPath := OpenDialog1.Files[0];
    Image1.Picture.LoadFromFile(OpenDialog1.Files[0]);
  end;
end;

end.
