unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    Louer1: TMenuItem;
    Louer2: TMenuItem;
    Creuncontrat1: TMenuItem;
    Gestion1: TMenuItem;
    Employee1: TMenuItem;
    Liste1: TMenuItem;
    Crer1: TMenuItem;
    Client1: TMenuItem;
    Liste2: TMenuItem;
    Crer2: TMenuItem;
    Vehicule1: TMenuItem;
    Liste3: TMenuItem;
    Ajouter1: TMenuItem;
    Comptabilits1: TMenuItem;
    Contrat1: TMenuItem;
    Facture1: TMenuItem;
    N1: TMenuItem;
    aide1: TMenuItem;
    propos1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Crer2Click(Sender: TObject);
    procedure Liste2Click(Sender: TObject);
    procedure Louer2Click(Sender: TObject);
    procedure Liste3Click(Sender: TObject);
    procedure Ajouter1Click(Sender: TObject);
    procedure Contrat1Click(Sender: TObject);
    procedure Liste1Click(Sender: TObject);
    procedure Crer1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Creuncontrat1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Catalogue, Stock, Unit4, Unit5, Unit6,unit7;

procedure TForm2.Ajouter1Click(Sender: TObject);
begin
   form3.Show;
form3.PageControl1.ActivePageIndex := 0;

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
form1.show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm2.Contrat1Click(Sender: TObject);
begin
form5.Show;
form5.forRent:=false;
end;

procedure TForm2.Crer1Click(Sender: TObject);
begin
form7.Show;
form7.PageControl1.ActivePageIndex := 0;
end;

procedure TForm2.Crer2Click(Sender: TObject);
begin
 form4.show;
 form4.PageControl1.ActivePageIndex := 0;
end;

procedure TForm2.Creuncontrat1Click(Sender: TObject);
begin
    form5.Show;
    form5.PageControl1.ActivePageIndex:=0;
    form5.forRent:=false;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  form6.Show;
  form6.PageControl1.ActivePageIndex :=1;
end;

procedure TForm2.Liste1Click(Sender: TObject);
begin
    form7.Show;
    form7.PageControl1.ActivePageIndex := 1;
end;

procedure TForm2.Liste2Click(Sender: TObject);
begin
     form4.show;
     form4.PageControl1.ActivePageIndex := 1;
end;

procedure TForm2.Liste3Click(Sender: TObject);
begin
form3.Show;
form3.PageControl1.ActivePageIndex := 1;

end;

procedure TForm2.Louer2Click(Sender: TObject);
begin
form1.show;
end;

end.
