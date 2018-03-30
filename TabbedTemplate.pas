unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Layouts,
  FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, Data.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    GestureManager1: TGestureManager;
    TabItem5: TTabItem;
    Button1: TButton;
    Label1: TLabel;
    route: TPanel;
    routeplan: TPanel;
    Button2: TButton;
    btndash: TButton;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    StyleBook1: TStyleBook;
    Chart2: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    dashboard: TVertScrollBox;
    Chart3: TChart;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    Panel1: TPanel;
    Grid1: TGrid;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btndashClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}

procedure TTabbedForm.btndashClick(Sender: TObject);
begin
  if btndash.Text='Show Dashboard' then
  begin
    btndash.Text:='Hide Dashboard';
    dashboard.BringToFront;
    dashboard.Visible:=true;
  end  else
  begin
    btndash.Text:='Show Dashboard';
    dashboard.SendToBack;
    dashboard.Visible:=false;
  end;
end;

procedure TTabbedForm.Button1Click(Sender: TObject);
begin
  routeplan.Visible:=true;
  route.Visible:=false;
end;

procedure TTabbedForm.Button2Click(Sender: TObject);
begin
  route.Visible:=true;
  routeplan.Visible:=false;
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
  dashboard.Visible:=false;
  grid1.Columns[0].Width:=110;
  grid1.Columns[2].Width:=40;
  grid1.Columns[3].Width:=55;
  grid1.Columns[4].Width:=55;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.TabControl1Change(Sender: TObject);
begin
//     showmessage(INTTOSTR(tabcontrol1.TabIndex))
end;

end.
