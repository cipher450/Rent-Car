object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Agence'
  ClientHeight = 358
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 20
    Top = 90
    Width = 26
    Height = 16
    Caption = 'Nom'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 353
    Height = 401
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Configuration'
    end
    object TabSheet2: TTabSheet
      Caption = 'Agence'
      ImageIndex = 1
      object Label2: TLabel
        Left = 16
        Top = 61
        Width = 26
        Height = 16
        Caption = 'Nom'
      end
      object Label4: TLabel
        Left = 16
        Top = 109
        Width = 109
        Height = 16
        Caption = 'Numero Telephone'
      end
      object Label5: TLabel
        Left = 16
        Top = 165
        Width = 46
        Height = 16
        Caption = 'Adresse'
      end
      object Label6: TLabel
        Left = 16
        Top = 213
        Width = 31
        Height = 16
        Caption = 'Email'
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 85
        Width = 313
        Height = 24
        DataField = 'Nom'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 133
        Width = 313
        Height = 24
        DataField = 'Numero_Telephone'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 181
        Width = 313
        Height = 24
        DataField = 'Adresse'
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 229
        Width = 313
        Height = 24
        DataField = 'Email'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBNavigator1: TDBNavigator
        Left = 48
        Top = 272
        Width = 240
        Height = 41
        DataSource = DataSource1
        VisibleButtons = [nbEdit, nbRefresh]
        TabOrder = 4
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 270
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Lenov0\Desktop\RentCar\Base\database.mdb;Mode=Share Deny Non' +
      'e;Persist Security Info=False;Jet OLEDB:System database="";Jet O' +
      'LEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:E' +
      'ngine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global ' +
      'Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLED' +
      'B:New Database Password="";Jet OLEDB:Create System Database=Fals' +
      'e;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale o' +
      'n Compact=False;Jet OLEDB:Compact Without Replica Repair=False;J' +
      'et OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 310
    Top = 16
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    MasterSource = DataSource1
    TableName = 'Agence'
    Left = 286
    Top = 65528
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Agence'
    Parameters = <>
    Left = 238
  end
end
