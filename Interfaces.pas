unit Interfaces;

{$I TBGWebCharts.inc}

interface

uses
  {$IF RTLVERSION > 22 }
    {$IFDEF HAS_FMX}
      {$IFDEF HAS_CHROMIUM}
        {$DEFINE HAS_CALLBACK}
      {$ENDIF}
    {$ELSE}
      {$DEFINE HAS_CALLBACK}
    {$ENDIF}
  {$ENDIF}

  DB,
  Generics.Collections,
  {$IFDEF HAS_FMX}
    FMX.StdCtrls,
    FMX.WebBrowser,
  {$ELSE}
    {$IF RTLVERSION > 27 }
      VCL.StdCtrls,
      VCL.Buttons,
      SHDocVw,
    {$IFEND}
    {$IF RTLVERSION < 28 }
      StdCtrls,
      Buttons,
      SHDocVw,
    {$IFEND}
  {$ENDIF}
  {$IFDEF HAS_CHROMIUM}
    uCEFInterfaces,
    {$IFDEF HAS_FMX}
      uCEFFMXChromium,
      uCEFFMXWindowParent,
    {$ELSE}
      uCEFChromium,
      uCEFWindowParent,
    {$ENDIF}
  {$ENDIF}
   System.SysUtils,
   Classes,
   Charts.Types;

type
  iWebCharts = interface;
  iModelHTML = interface;
  iModelHTMLChartsBar = interface;
  iModelHTMLCharts = interface;
  iModelHTMLChartsConfig = interface;
  IModelRowsTitleConfig = interface;
  IModelHTMLRows = interface;
  iModelHTMLRowsTitle = interface;
  IModelHTMLRowsTag = interface;
  iModelHTMLChartsDoughnut = interface;
  iModelHTMLChartsLines = interface;
  iModelHTMLDataSet = interface;
  iModelHTMLChartsLineStacked = interface;
  iModelHTMLChartsPie = interface;
  iModelLabellingConfig<T> = interface;
  iModelHTMLChartsAxes = interface;
  iModelHTMLChartsAxesTicks<T> = interface;
  iModelHTMLChartsAxesParam = interface;
  iModelHTMLChartsAxesParamRealTime = interface;
  iModelHTMLChartsAxesGridLines<T> = interface;
  iModelHTMLChatsAxesScaleLabel<T> = interface;
  iModelHTMLLegendLabels<T> = interface;
  iModelHTMLLegend = interface;
  iModelHTMLTitle<T> = interface;
  iModelHTMLScales = interface;
  iModelHTMLTooltip<T> = interface;
  iModelHTMLOptions = interface;
  iModelHTMLChartsGeneric = interface;
  iModelJumbotron = interface;
  iModelAlerts = interface;
  iModelAlertsClass = interface;
  iModelListGroup = interface;
  iModelListGroupClass = interface;
  iModelPivotTable = interface;
  iModelGenericList<T> = interface;
  iModelPivotTableConfig = interface;
  iModelPivotTableClass = interface;
  iModelGenericStyle<T> = interface;
  iModelGenericDataSet<T> = interface;
  iModelJSCommand = interface;
  iModelHTMLPlugins = interface;
  iModelTableActionImage = Interface;
  iModelTableAction = interface;
  iModelBrowser = interface;
  iModelGenericCoordinates<T> = interface;
  iModelCredenciais = interface;

  iModelMaps = interface;
  iModelGenericTitle<T> = interface;
  iModelMapsGeneric = interface;
  iModelMapsOptions = interface;
  iModelMapsDraw = interface;
  iModelMapsDrawCircle = interface;
  iModelMapsDrawMarker = interface;
  iModelMapsLayer = interface;
  iModelMapsLayerHeatMap = interface;
  iModelMapsDataSet<T> = interface;
  {$IFDEF HAS_CHROMIUM}
    iModelChromiumResources = interface;
    iModelChromiumResourcesPages = interface;
    iModelChromiumResourcesJSCallback = interface;

  {$ENDIF}

  {$IFDEF FULL}
    iModelTable = interface;
    iModelTableDataSet = interface;
    iModelTableOption = interface;
    iModelTableData = interface;
    iModelTableFeatures = interface;
    iModelTableClass = interface;
    IModelHTMLRowsDiv = interface;
    iModelCardsDataSet = interface;
    iModelCards = interface;
    iModelChartEasyPie = interface;
    iModelButtonClass = interface;
    iModelButton = interface;
    {$IFDEF HAS_CALLBACK}
      iCallbackJS = interface;
    {$ENDIF}
    iModelImageDataSet = interface;
    iModelImage = interface;
    iModelImageClass = interface;
    IModelHTMLRowsP = interface;
    //iCacheControl = interface;
  {$ENDIF}

  iWebCharts = interface
    ['{D98D23CE-5E37-4941-89E3-92AF922ACE60}']
    function NewProject : iModelHTML; overload;
    function NewProject(Container : Boolean) : iModelHTML; overload;
    function ContinuosProject : iModelHTML;
    function AddResource(Value : String) : iWebCharts;
    function BackgroundColor(Value : String) : iWebCharts;
    function Container(Value : TTypeContainer) : iWebCharts;
    function FontColor(Value : String) : iWebCharts;
    function CDN(Value : Boolean) : iWebCharts;
    function Credenciais : iModelCredenciais;
  end;

  iModelHTML = interface
    ['{6D5210CC-D750-4643-8685-48037F21E6AA}']
    function GenerateHead : iModelHTML; overload;
    function GenerateHead(Value : TList<String>) : iModelHTML; overload;
    function GenerateFooter : iModelHTML;
    function Jumpline : iModelHTML;
    function Charts : iModelHTMLCharts;
    function Rows : IModelHTMLRows;
    function HTML(Value : String) : iModelHTML; overload;
    function HTML : String; overload;
    function ClearHTML : iModelHTML;
    function WebBrowser(Value : TWebBrowser) : iModelHTML; overload;
    {$IFDEF HAS_CHROMIUM}
      {$IFDEF HAS_FMX}
        function WebBrowser(Value : TFMXChromium) : iModelHTML; overload;
        function WindowParent(Value: TFMXWindowParent) : iModelHTML; overload;
      {$ELSE}
        function WebBrowser(Value : TChromium) : iModelHTML; overload;
        function WindowParent(Value: TCEFWindowParent) : iModelHTML; overload;
      {$ENDIF}
      function Maps : iModelMaps;
    {$ENDIF}
    function Generated : iModelHTML;
    function Container(Value : Boolean) : iModelHTML;
    function FolderDefaultRWC(Value : String) : iModelHTML;
    function BackgroundColor( Value : String) : iModelHTML;
    function FontColor ( Value : String) : iModelHTML;
    function ContainerClass(Value : TTypeContainer) : iModelHTML;
    function CDN(Value : Boolean) : iModelHTML;
    function Jumbotron : iModelJumbotron;
    function Alerts : iModelAlerts;
    function ListGroup : iModelListGroup;
    function PivotTable : iModelPivotTable;
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Credenciais(Value : iModelCredenciais) : iModelHTML;
    {$IFDEF FULL}
      function Table : iModelTable;
      function Cards : iModelCards;
      function ChartEasyPie : iModelChartEasyPie;
      {$IFDEF HAS_CALLBACK}
        function CallbackJS : iCallbackJS;
        function Buttons : iModelButton;
      {$ENDIF}
      function Image : iModelImage;
      //function CacheControl : iCacheControl;
    {$ENDIF}
  end;

  iModelCredenciais = interface
    ['{FCE8B965-DB1B-42E6-B831-588BB955A88A}']
    function APIGoogle(Value : string) : iModelCredenciais; overload;
    function APIGoogle : string; overload;
    function &End : iWebCharts;
  end;

  iModelBrowser = interface
  ['{90CE8FFC-31D4-423B-A585-5A6B5E01A3F8}']
    procedure ExecuteScript(Value : iModelJSCommand);
    function ExecuteScriptResult(Value : iModelJSCommand) : string;
    procedure ExecuteScriptCallback(Value: iModelJSCommand);
    function Generated(FHTML : string) : iModelBrowser;
  end;

  iModelMaps = interface
    ['{6FB8BE17-5803-418D-B9A6-2448DFE5B6F9}']
    function MapType(Value : TTypeMaps) : iModelMapsGeneric;
    function MapTitle : iModelGenericTitle<iModelMaps>;
    function &End : iModelHTML;
  end;

  iModelGenericTitle<T> = interface
    ['{BBADD905-F041-4B05-8729-5F6ED7C3F286}']
    function Text(Value : string) : iModelGenericTitle<T>; overload;
    function FontSize(Value : Integer) : iModelGenericTitle<T>; overload;
    function TextAlignment(Value : string) : iModelGenericTitle<T>; overload;
    function FontColorHEX(Value : string) : iModelGenericTitle<T>; overload;
    function FontFamily(Value : string) : iModelGenericTitle<T>; overload;
    function Text : string; overload;
    function FontSize : Integer; overload;
    function TextAlignment : string; overload;
    function FontColorHEX : string; overload;
    function FontFamily : string; overload;
    function Result : string;
    function &End : T;
  end;

  iModelMapsGeneric = interface
    ['{9831E9BF-E318-4D65-9722-B1A8E9562AC3}']
    function Name(Value : String) : iModelMapsGeneric; overload;
    function Options : iModelMapsOptions;
    function Height(Value : String) : iModelMapsGeneric;
    function Width(Value : String) : iModelMapsGeneric;
    function Draw : iModelMapsDraw;
    function Layer : iModelMapsLayer;
    function Name : String; overload;
    function &End : iModelMaps;
    function ResultClass : string;
  end;

  iModelMapsOptions = interface
    ['{ADAAA471-ED18-411D-9855-04ABFCCBB9B6}']
    function Center : iModelGenericCoordinates<iModelMapsOptions>;
    function Zoom(Value : Integer) : iModelMapsOptions;
    function FullScreenControl : iModelMapsOptions;
    function MapTypeControl : iModelMapsOptions;
    function StreetViewControl : iModelMapsOptions;
    function ZoomControl : iModelMapsOptions;
    function MapStyle(Value: TTypeMapStyle) : iModelMapsOptions;
    function ResultScript : String;
    function &End : iModelMapsGeneric;
  end;

  iModelMapsDraw = interface
    ['{00620760-9D3F-48FE-9FB4-91CB43C64F53}']
    function Marker : iModelMapsDrawMarker;
    function Circle : iModelMapsDrawCircle;
    function ResultScript : String;
    function &End : iModelMapsGeneric;
  end;

  iModelMapsDrawMarker = interface
    ['{03FDD2B8-7C64-41C1-A9B6-4284EBE6B997}']
    function DataSet : iModelMapsDataSet<iModelMapsDrawMarker>;
    function ResultScript(Value: string) : String;
    function &End : iModelMapsDraw;

  end;

  iModelMapsDrawCircle = interface
    ['{14E21290-71DA-4BE7-919B-DA81B6E765E7}']
    function DataSet : iModelMapsDataSet<iModelMapsDrawCircle>;
    function StrokeColor(Value: string): iModelMapsDrawCircle;
    function StrokeOpacity(Value : string) : iModelMapsDrawCircle;
    function StrokeWeight(Value : Integer) : iModelMapsDrawCircle;
    function FillColor(Value : string) : iModelMapsDrawCircle;
    function FillOpacity(Value : string) : iModelMapsDrawCircle;
    function Fator(Value : integer) : iModelMapsDrawCircle;
    function ResultScript(Value: string) : String;
    function &End : iModelMapsDraw;

  end;

  iModelMapsLayer = interface
    ['{ACABBD56-A9D9-4D0B-85B1-6D115C218FAD}']
    function HeatMap : iModelMapsLayerHeatMap;
    function &End : iModelMapsGeneric;
    function ResultScript : String;
  end;

  iModelMapsLayerHeatMap = interface
    ['{A46B4845-FF76-48D5-AB8A-C7F39D0FE34C}']
    function DataSet : iModelMapsDataSet<iModelMapsLayerHeatMap>;
    function Radius(Value : string) : iModelMapsLayerHeatMap; overload;
    function Opacity(Value : string) :iModelMapsLayerHeatMap; overload;
    function Radius : string; overload;
    function Opacity : string; overload;
    function &End : iModelMapsLayer;
    function ResultScript : String;
  end;

  iModelMapsDataSet<T> = interface
    ['{F58E5C44-D904-4347-BC57-CF7889DB4DD1}']
    function DataSet (Value : TDataSet) : iModelMapsDataSet<T>; overload;
    function LatName(Value : String) : iModelMapsDataSet<T>; overload;
    function LngName(Value : String) : iModelMapsDataSet<T>; overload;
    function LabelName(Value : String) : iModelMapsDataSet<T>; overload;
    function ValueName(Value : String) : iModelMapsDataSet<T>; overload;
    function DataSet : TDataSet; overload;
    function LatName : String; overload;
    function LngName : String; overload;
    function LabelName : String; overload;
    function ValueName : String; overload;
    function &End : T;
  end;

  {$IFDEF HAS_CHROMIUM}
    iModelChromiumResourcesPages = interface
      ['{30782EC6-B430-4FC1-9B23-D06693BE23D4}']
        function Add(HTML : String) : string;
        function Get(Key : String) : ICefResourceHandler;
        function Extract(Key : String) :ICefResourceHandler;
        procedure Remove(Key : String);
    end;

    iModelChromiumResourcesJSCallback = interface
      ['{384A33CB-A7E7-40C3-88EA-F656605C0964}']
        function Add(Proc : TProc<string>) : string;
        function Get(Key : String) : TProc<string>;
        function Extract(Key : String) :TProc<string>;
        procedure Remove(Key : String);
    end;

    iModelChromiumResources = interface
      ['{16F507A0-D848-4491-AF0A-8AE73782FBB2}']
      function Pages : iModelChromiumResourcesPages;
      function JSCallback : iModelChromiumResourcesJSCallback;
    end;

  {$ENDIF}

//  iLabelLing = interface
//    function Numeral(Value : String) : iLabelLing;
//    function Result : String;
//  end;
//
//  iNumeral = interface
//    function Result(Value : String) : String;
//  end;

  IModelHTMLRows = interface
    ['{684C6EA3-4C2D-4AA9-9A94-BF0A07B14A8B}']
    function HTML(Value : String) : IModelHTMLRows; overload;
    function HTML : String; overload;
    function Title : iModelHTMLRowsTitle;
    function Tag : iModelHTMLRowsTag;
    {$IFDEF FULL}
    function _Div : IModelHTMLRowsDiv;
    function _P : IModelHTMLRowsP;
    {$ENDIF}
    function &End : iModelHTML;
  end;

  IModelHTMLRowsTag = interface
    ['{15075847-E7A6-4F18-878D-A7DBCECABE94}']
    function Add(Value : String) : IModelHTMLRowsTag;
    function &End : IModelHTMLRows;
  end;

  iModelHTMLRowsTitle = interface
    ['{F2D34927-8232-4A18-944A-DB0ADAD1C903}']
    function HTML(Value : String) : iModelHTMLRowsTitle; overload;
    function HTML : String; overload;
    function Configuracoes : IModelRowsTitleConfig;
    function Config : IModelRowsTitleConfig;
    function &End : IModelHTMLRows;
  end;

  IModelRowsTitleConfig = interface
    ['{87031018-5C12-42DF-895F-2602B87FE468}']
    function H1(Value : String) : IModelRowsTitleConfig; overload;
    function H1 : String; overload;
    function H2(Value : String) : IModelRowsTitleConfig; overload;
    function H2 : String; overload;
    function H3(Value : String) : IModelRowsTitleConfig; overload;
    function H3 : String; overload;
    function H4(Value : String) : IModelRowsTitleConfig; overload;
    function H4 : String; overload;
    function H5(Value : String) : IModelRowsTitleConfig; overload;
    function H5 : String; overload;
    function &End : iModelHTMLRowsTitle;
  end;

  iModelHTMLCharts = interface
    ['{4CC23536-78BD-40F7-B4A8-D5625E849065}']
    function _ChartType(Value : TTypeChart) : iModelHTMLChartsGeneric; overload;
    function _ChartType : TTypeChart; overload;
    function HTML(Value : String) : iModelHTMLCharts; overload;
    function HTML : String; overload;
    function &End : iModelHTML;
  end;

  iModelHTMLChartsGeneric = interface
    ['{83AA6A13-6102-4352-9503-FF9C4AA2C4C7}']
    function HTML(Value : String) : iModelHTMLChartsGeneric; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
    function UpdateRealTime : iModelHTMLChartsGeneric;
    function UpdateChart : iModelHTMLChartsGeneric;
  end;

  iModelHTMLChartsDoughnut = interface
    ['{709FF228-7F8A-4E2B-8AB9-EFAEC9AEE1B4}']
    function SemiCircule ( aValue : Boolean ) : iModelHTMLChartsDoughnut; overload;
    function HTML(Value : String) : iModelHTMLChartsDoughnut; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsBar = interface
    ['{25AE0278-2105-4223-86A9-41F289F75EAE}']
    function HTML(Value : String) : iModelHTMLChartsBar; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLines = interface
    ['{10DCD4CF-984F-4952-919A-5259A13A9D8D}']
    function HTML(Value : String) : iModelHTMLChartsLines; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsLineStacked = interface
    ['{6A3F3157-8FB2-4D72-A33A-27A66BED2661}']
    function HTML(Value : String) : iModelHTMLChartsLineStacked; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsPie = interface
    ['{470E91C0-58DF-440E-AF3A-445746F0CFE0}']
    function HTML(Value : String) : iModelHTMLChartsPie; overload;
    function HTML : String; overload;
    function Attributes : iModelHTMLChartsConfig;
    function &End : iModelHTMLCharts;
  end;

  iModelHTMLChartsConfig = interface
    ['{B140654A-10FE-48A2-93B8-3D90743E3F1E}']
    function Name(Value : String) : iModelHTMLChartsConfig; overload;
    function Name : String; overload;
    function IDChart : String;
    function Labels(Value : String) : iModelHTMLChartsConfig; overload;
    function Labels : String; overload;
    function ColSpan(Value : Integer) : iModelHTMLChartsConfig; overload;
    function ColSpan : Integer; overload;
    function Width(Value : Integer) : iModelHTMLChartsConfig; overload;
    function Width : Integer; overload;
    function Heigth(Value : Integer) : iModelHTMLChartsConfig; overload;
    function Heigth : Integer; overload;
    function Data(Value : String) : iModelHTMLChartsConfig; overload;
    function Data : String; overload;
    function BackgroundColor(Value : String) : iModelHTMLChartsConfig; overload;
    function BackgroundColor : String; overload;
    function DataSet : iModelHTMLDataSet;
    function ResultDataSet : String;
    function ResultRealTimeInitialValue : String;
    function ResultLabels : String;
    function Stacked(Value : Boolean) : iModelHTMLChartsConfig; overload;
    function Stacked : Boolean; overload;
    function CallBackLink(Value : String) : iModelHTMLChartsConfig; overload;
    function CallBackLink : String; overload;
    function Labelling : iModelLabellingConfig<iModelHTMLChartsConfig>; overload;
    function Options : iModelHTMLOptions;
    function &End : iModelHTMLChartsGeneric;
  end;

  iModelHTMLOptions = interface
    ['{8984AFE4-EBFC-4C97-B7BC-D3DA8FFFB42B}']
    function SemiCircule ( Value : Boolean ) : iModelHTMLOptions;
    function Scales : iModelHTMLScales;
    function Legend : iModelHTMLLegend;
    function Title : iModelHTMLTitle<iModelHTMLOptions>;
    function Tooltip : iModelHTMLTooltip<iModelHTMLOptions>;
    function Plugins : iModelHtmlplugins;
    function Result : String;
    function &End : iModelHTMLChartsConfig;
  end;

  iModelHTMLPlugins = interface
    ['{55083212-FCFF-4AEC-A1ED-AEFC2C39BB5E}']
    function Streaming(Value : Boolean) : iModelHTMLPlugins;
    function Result : String;
    function &End : iModelHTMLOptions;
  end;

  iModelHTMLScales = interface
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function GeneratedAxes ( Value : Boolean ) : iModelHTMLScales;
    function Axes : iModelHTMLChartsAxes;
    function Result : String;
    function &End : iModelHTMLOptions;
  end;

  iModelHTMLTooltip<T> = interface
    ['{5968D5D3-75C9-4F2C-9E66-3361A92D8DA4}']
    function Format(Value : String) : iModelHTMLTooltip<T>;
    function Enabled(Value : Boolean) : iModelHTMLTooltip<T>;
    function ToolTipNoScales : iModelHTMLTooltip<T>;
    function InteractionModeNearest : iModelHTMLTooltip<T>;
    function InteractionModePoint : iModelHTMLTooltip<T>;
    function InteractionModeIndex : iModelHTMLTooltip<T>;
    function InteractionModeDataset : iModelHTMLTooltip<T>;
    function InteractionModeX : iModelHTMLTooltip<T>;
    function InteractionModeY : iModelHTMLTooltip<T>;
    function Intersect(Value : Boolean) : iModelHTMLTooltip<T>;
    function DisplayTitle(Value : Boolean) : iModelHTMLTooltip<T>;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLTitle<T> = interface
    ['{21A4474D-87C2-435B-9881-D385518C6EA6}']
    function display ( Value : Boolean ) :  iModelHTMLTitle<T>; overload;
    function display : Boolean; overload;
    function text ( Value : String ) : iModelHTMLTitle<T>; overload;
    function text : string; overload;
    function position ( Value : String ) : iModelHTMLTitle<T>; overload;
    function position : String; overload;
    function fontSize ( Value : Integer ) : iModelHTMLTitle<T>; overload;
    function fontSize : Integer; overload;
    function fontFamily ( Value : String ) : iModelHTMLTitle<T>; overload;
    function fontFamily : String; overload;
    function fontColorHEX ( Value : String ) : iModelHTMLTitle<T>; overload;
    function fontColorHEX : String; overload;
    function fontStyle ( Value : String ) : iModelHTMLTitle<T>; overload;
    function fontStyle : String; overload;
    function padding ( Value : Integer ) : iModelHTMLTitle<T>; overload;
    function padding : Integer; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLLegend = interface
    ['{BC60AEB1-5404-4355-868A-D26BB5A2C773}']
    function Labels : iModelHTMLLegendLabels<iModelHTMLLegend>;
    function display ( Value : Boolean ) : iModelHTMLLegend; overload;
    function display : Boolean; overload;
    function position ( Value : String ) : iModelHTMLLegend; overload;
    function position : String; overload;
    function Result : String;
    function &End : iModelHTMLOptions;
  end;

  iModelHTMLLegendLabels<T> = interface
    ['{796188B6-4031-43E8-ABF1-43D6C8E1B18D}']
    function fontSize (Value : Integer) : iModelHTMLLegendLabels<T>; overload;
    function fontSize : Integer; overload;
    function fontStyle ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
    function fontStyle : String; overload;
    function fontColorHEX ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
    function fontColorHEX : String; overload;
    function fontFamily ( Value : String ) : iModelHTMLLegendLabels<T>; overload;
    function fontFamily : String; overload;
    function padding ( Value : Integer ) : iModelHTMLLegendLabels<T>; overload;
    function padding : Integer; overload;
    function Result : String;
    function &End : T;
  end;

  iModelLabellingConfig<T> = interface
    ['{4BBEDE9F-9F02-4E92-AFA4-3B301DEC6672}']
    function Format ( Value : String) : iModelLabellingConfig<T>; overload;
    function Format : String; overload;
    function RGBColor ( Value : String ) : iModelLabellingConfig<T>; overload;
    function RGBColor : String; overload;
    function FontSize ( Value : Integer) : iModelLabellingConfig<T>; overload;
    function FontSize : Integer; overload;
    function FontStyle (Value : String) : iModelLabellingConfig<T>; overload;
    function FontStyle : String; overload;
    function FontFamily (Value : String) : iModelLabellingConfig<T>; overload;
    function FontFamily : String; overload;
    function Padding (Value : Integer) : iModelLabellingConfig<T>; overload;
    function Padding : Integer; overload;
    function PaddingX (Value : Integer) : iModelLabellingConfig<T>; overload;
    function PaddingX : Integer; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLChartsAxes = interface
    ['{2E97CD69-FDAC-4A01-ADA6-0EA9F1FFFF7C}']
    function xAxe : iModelHTMLChartsAxesParam;
    function yAxe : iModelHTMLChartsAxesParam;
    function Result : String;
    function &End : iModelHTMLScales;
  end;

  iModelHTMLChartsAxesParam = interface
    ['{E4C5DE93-B372-4D75-ADD2-8A3D1F30223E}']
    function Ticks : iModelHTMLChartsAxesTicks<iModelHTMLChartsAxesParam>;
    function GridLines : iModelHTMLChartsAxesGridLines<iModelHTMLChartsAxesParam>;
    function ScaleLabel : iModelHTMLChatsAxesScaleLabel<iModelHTMLChartsAxesParam>;
    function Position (Value : String) : iModelHTMLChartsAxesParam; overload;
    function Position : String; overload;
    function OffSet (Value : Boolean) : iModelHTMLChartsAxesParam; overload;
    function OffSet : Boolean; overload;
    function _Type (Value : String) : iModelHTMLChartsAxesParam; overload;
    function _Type : String; overload;
    function RealTime : iModelHTMLChartsAxesParamRealTime;
    function Stacked ( Value : Boolean ) : iModelHTMLChartsAxesParam; overload;
    function Stacked : Boolean; overload;
    function Result : String;
    function &End : iModelHTMLChartsAxes;
  end;

  iModelHTMLChartsAxesParamRealTime = interface
    ['{448ECDC3-69C1-44F3-B5C5-6C2336F60321}']
    function Duration (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
    function Ttl (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
    function Delay (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
    function Refresh (Value : Integer) : iModelHTMLChartsAxesParamRealTime;
    function Result : String;
    function &End : iModelHTMLChartsAxesParam;
  end;

  iModelHTMLChatsAxesScaleLabel<T> = interface
    ['{FC645855-267C-4876-8BE2-EE540732C6A5}']
    function display (Value : Boolean) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function display : Boolean; overload;
    function labelString ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function labelString : String; overload;
    function fontColorHEX ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function fontColorHEX  : String; overload;
    function fontFamily ( Value : String ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function fontFamily : String; overload;
    function fontSize ( Value : Integer) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function fontSize : Integer; overload;
    function fontStyle ( Value : String) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function fontStyle : String; overload;
    function padding ( Value : Integer ) : iModelHTMLChatsAxesScaleLabel<T>; overload;
    function padding : Integer; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLChartsAxesGridLines<T> = interface
    ['{F9043117-4398-478D-8EA2-8E5E065FB142}']
    function display (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function display : Boolean; overload;
    function circular (Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function circular : Boolean; overload;
    function colorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function colorRGBA : String; overload;
    function drawBorder ( Value : Boolean ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawBorder : Boolean; overload;
    function drawOnChartArea ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawOnChartArea : Boolean; overload;
    function drawTicks ( Value : Boolean) : iModelHTMLChartsAxesGridLines<T>; overload;
    function drawTicks : Boolean; overload;
    function tickMarkLength ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function tickMarkLength : Integer; overload;
    function zeroLineWidth ( Value : Integer ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function zeroLineWidth : Integer; overload;
    function zeroLineColorRGBA ( Value : String ) : iModelHTMLChartsAxesGridLines<T>; overload;
    function zeroLineColorRGBA : String; overload;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLChartsAxesTicks<T> = interface
    ['{C56445FE-00C6-47E1-8B38-F0FE57419A71}']
    function fontColor (Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
    function fontColor : String; overload;
    function fontSize (Value : integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function fontSize : integer; overload;
    function fontFamily (Value : string) : iModelHTMLChartsAxesTicks<T>; overload;
    function fontFamily : string; overload;
    function autoSkip (Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
    function autoSkip : Boolean; overload;
    function autoSkipPadding (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function autoSkipPadding : Integer; overload;
    function labelOffset (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function labelOffset : Integer; overload;
    function maxRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function maxRotation : Integer; overload;
    function minRotation (Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function minRotation : Integer; overload;
    function mirror ( Value : Boolean) : iModelHTMLChartsAxesTicks<T>; overload;
    function mirror : Boolean; overload;
    function padding ( Value : Integer) : iModelHTMLChartsAxesTicks<T>; overload;
    function padding : Integer; overload;
    function format ( Value : String) : iModelHTMLChartsAxesTicks<T>; overload;
    function format : String; overload;
    function BeginAtZero (Value : Boolean) : iModelHTMLChartsAxesTicks<T>;
    function Result : String;
    function &End : T;
  end;

  iModelHTMLDataSet = interface
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function DataSet (Value : TDataSet) : iModelHTMLDataSet;
    function RealTimeDataSet (Value : TDataSet) : iModelHTMLDataSet;
    function LabelName(Value : String) : iModelHTMLDataSet;
    function ValueName(Value : String) : iModelHTMLDataSet;
    function RGBName(Value : String)  : iModelHTMLDataSet;
    function textLabel(Value : String) : iModelHTMLDataSet;
    function BackgroundColor (Value : String) : iModelHTMLDataSet;
    function BorderColor (Value : String) : iModelHTMLDataSet;
    function BorderWidth (Value : Integer) : iModelHTMLDataSet;
    function Data (Value : String) : iModelHTMLDataSet;
    function Fill (Value : Boolean) : iModelHTMLDataSet;
    function LineTension (Value : Integer) : iModelHTMLDataSet;
    function BorderDash (Lenght : Integer; Space : Integer) : iModelHTMLDataSet;
    function ResultScript : String;
    function ResultLabels : String;
    function RealTimeInitialValue : String;
    function Types (Value : String) : iModelHTMLDataSet;
    function &End : iModelHTMLChartsConfig;
  end;

  iModelHTMLFactory = interface
    ['{8CF35864-C906-4B8B-AC69-CD2F2001D906}']
    function HTML : iModelHTML;
    function Charts(Parent : iModelHTML) : iModelHTMLCharts;
    function Rows(Parent : iModelHTML) : IModelHTMLRows;
    function RowsTitle(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
    {$IFDEF FULL}
    function Table(Parent : iModelHTML) : iModelTable;
    function Cards(Parent : iModelHTML) : iModelCards;
    function Image(Parent : iModelHTML) : iModelImage;
    function ChartEasyPie(Parent : iModelHTML) : iModelChartEasyPie;
    {$ENDIF}
  end;

  iModelColors<T> = interface
    ['{8A6FA48B-BCB6-468B-A6EC-BC582B898E16}']
    function Primary : iModelColors<T>;
    function Secondary : iModelColors<T>;
    function Success : iModelColors<T>;
    function Danger : iModelColors<T>;
    function Warning : iModelColors<T>;
    function Info : iModelColors<T>;
    function Light : iModelColors<T>;
    function Dark : iModelColors<T>;
    function Result : String;
    function &End : T;
  end;

  iModelJumbotron = interface
    ['{90EB606E-886D-4333-ADD4-3A723A4F989B}']
    function Title(Value : String) : iModelJumbotron;
    function Description(Value : String) : iModelJumbotron;
    function &End : iModelHTML;
  end;

  iModelAlerts = interface
    ['{F6967759-446A-42EF-9459-DE04C83BB65B}']
    function Title(Value : String) : iModelAlerts;
    function AlertsClass : iModelAlertsClass;
    function &End : iModelHTML;
  end;

  iModelAlertsClass = interface
    ['{B877835D-FABB-4E0E-A44D-72DEC61B098B}']
    function primary : iModelAlertsClass;
    function secondary : iModelAlertsClass;
    function success : iModelAlertsClass;
    function danger : iModelAlertsClass;
    function warning : iModelAlertsClass;
    function info : iModelAlertsClass;
    function light : iModelAlertsClass;
    function dark : iModelAlertsClass;
    function ResultClass : String;
    function &End : iModelAlerts;
  end;

  iModelGenericDataSet<T> = interface
    ['{761961EF-0C2B-4B88-AC8F-B4806D530D07}']
    function DataSet (Value : TDataSet) : iModelGenericDataSet<T>; overload;
    function LabelName(Value : String) : iModelGenericDataSet<T>; overload;
    function ValueName(Value : String) : iModelGenericDataSet<T>; overload;
    function RGBName(Value : String)  : iModelGenericDataSet<T>; overload;
//    function textLabel(Value : String) : iModelGenericDataSet<T>;
//    function BackgroundColor (Value : String) : iModelGenericDataSet<T>;
//    function BorderColor (Value : String) : iModelGenericDataSet<T>;
//    function BorderWidth (Value : Integer) : iModelGenericDataSet<T>;
//    function Data (Value : String) : iModelGenericDataSet<T>;
//    function Fill (Value : Boolean) : iModelGenericDataSet<T>;
//    function ResultLabels : String;
//    function Types (Value : String) : iModelGenericDataSet<T>;
    function CallbackLink(Field : String; MethodName : String) : iModelGenericDataSet<T>; overload;
    function CallbackLink: TDictionary<String, String>; overload;
    function &End : T;
    function DataSet : TDataSet; overload;
    function ValueName : String; overload;
    function LabelName : String; overload;
    function RGBName : String; overload;
    function DataSetJstringify : string;
 end;

  iModelListGroup = interface
    ['{4E7BC346-00A5-4B5C-92A2-348107CFEADA}']
    function ListGroupType : iModelListGroupClass;
    function DataSet : iModelGenericDataSet<iModelListGroup>;
    function &End : iModelHTML;
  end;

  iModelListGroupClass = interface
    ['{9DE42B06-A698-437D-B25D-2A6CB8A9B409}']
    function Basic : iModelListGroupClass;
    function Flush : iModelListGroupClass;
    function Action : iModelListGroupClass;
    function Horizontal : iModelListGroupClass;
    function TagIn : String;
    function ElementIn : String;
    function ElementOut : String;
    function ClassType : String;
    function &End : iModelListGroup;
  end;

  iModelGenericList<T> = interface
    ['{BCF34A04-11DC-437B-BACA-97FBB4F0C7AF}']
    function Add(Value : string) : iModelGenericList<T>;
    function List : TList<String>;
    function &End : T;
  end;

  iModelPivotTableConfig = interface
    ['{B5F32DE7-8BEA-40B3-92B6-5AD7EA2BB3FE}']
    function ConfigBackgroundColor(Value : string) : iModelPivotTableConfig;
    function ConfigHeadStyle : iModelGenericStyle<iModelPivotTableConfig>;
    function ConfigBodyStyle : iModelGenericStyle<iModelPivotTableConfig>;
    function PivotOptions(Value : string) : iModelPivotTableConfig; overload;
    function DataSet : iModelGenericDataSet<iModelPivotTableConfig>;
    function Rows : iModelGenericList<iModelPivotTableConfig>;
    function Cols : iModelGenericList<iModelPivotTableConfig>;
    function &End : iModelPivotTable;
    function PivotType : iModelPivotTableClass;
    function ShowPivotUI(Value : Boolean) : iModelPivotTableConfig; overload;
    function PivotOptions : string; overload;
    function ShowPivotUI : string; overload;
    function ResultStyle : string;
    function ResultData : string;
  end;

  iModelJSCommand = interface
    ['{60141CC4-A117-4500-B28E-C09B2339E6B8}']
    function Command(Value : string) :iModelJSCommand;
    function Paramters : iModelGenericList<iModelJSCommand>; overload;
    function TagName(Value : string) :iModelJSCommand; overload;
    function TagID(Value : string) : iModelJSCommand; overload;
    function TagAttribute(Value : string) : iModelJSCommand; overload;
    function Callback(Value : TProc<String>) : iModelJSCommand; overload;
    function TestBeforeExecute(Value : Boolean) : iModelJSCommand;
    function ResultCommand : string; overload;
    function TagName : string; overload;
    function TagID : string; overload;
    function TagAttribute : string; overload;
    function Callback : TProc<String>; overload;
  end;

  iModelPivotTable = interface
    ['{D9C25BD4-9C5F-4F8C-AFA7-D251193609A9}']
    function Attributes : iModelPivotTableConfig;
    function SaveConfig : string; overload;
    function SaveConfig(Value : TProc<String>) : iModelPivotTable; overload;
    function LoadConfig(Value : string) : iModelPivotTable;
    function ShowUI : iModelPivotTable;
    function HideUI : iModelPivotTable;
    function &End : iModelHTML;
  end;

  iModelPivotTableClass = interface
    ['{B5695B31-A3C9-45A4-86D8-3542736EC848}']
    function Tabela : iModelPivotTableClass;
    function TabelaComBarras : iModelPivotTableClass;
    function MapaDeCalor : iModelPivotTableClass;
    function MapaDeCalorPorLinhas : iModelPivotTableClass;
    function MapaDeCalorPorColunas : iModelPivotTableClass;
    function BarrasHorizontais : iModelPivotTableClass;
    function BarrasHorizontaisEmpilhadas : iModelPivotTableClass;
    function GraficoDeBarras : iModelPivotTableClass;
    function GraficoDeBarrasEmpilhadas : iModelPivotTableClass;
    function GraficoDeLinhas : iModelPivotTableClass;
    function GraficoDeArea : iModelPivotTableClass;
    function GraficoDePizzaMultiplo : iModelPivotTableClass;
    function ResultClass : string;
    function &End : iModelPivotTableConfig;
  end;

  iModelGenericStyle<T> = interface
  ['{C98A4A18-4BA5-45E1-B442-0D728E7138E3}']
    function BackgroundColor(Value : string) : iModelGenericStyle<T>; overload;
    function FontColor(Value : string) : iModelGenericStyle<T>; overload;
    function FontSize(Value : Integer) : iModelGenericStyle<T>; overload;
    function FontSize(Value : string) : iModelGenericStyle<T>; overload;
    function BackgroundColor : string; overload;
    function FontColor : string; overload;
    function FontSize : string; overload;
    function &End : T;
  end;

  iModelGenericCoordinates<T> = interface
    ['{AE9131DA-6C0D-4A8F-876F-9D86EA6794E7}']
    function Latitude(Value : string) : iModelGenericCoordinates<T>; overload;
    function Longitude(Value : string) : iModelGenericCoordinates<T>; overload;
    function Latitude : string; overload;
    function Longitude : string; overload;
    function &End : T;
  end;

  {$IFDEF FULL}
  IModelHTMLRowsP = interface
    ['{F26E4162-73CC-40E9-8E35-9499B6D61673}']
    function _Class(Value : String) : IModelHTMLRowsP;
    function Add(Value : String) : iModelHTMLRowsP;
    function &End : IModelHTMLRows;
  end;

  iModelTable = interface
    ['{D0151987-64C8-40E2-A83C-18AF9648F8AE}']
    function &End : iModelHTML;
    function DataSet : iModelTableDataSet;
    function TableClass : iModelTableClass;
    function TableOptions : iModelTableOption;
    function TableFeatures : iModelTableFeatures;
    function TableData : iModelTableData;
    function Datatable(Value : Boolean) : iModelTable;
  end;

  iModelTableClass = interface
    ['{AC891435-E424-4C9D-BC69-4B05A705B96E}']
    function tableDark : iModelTableClass;
    function tableStriped : iModelTableClass;
    function tableBordered : iModelTableClass;
    function tableHover : iModelTableClass;
    function tableSm : iModelTableClass;
    function tableResponsive : iModelTableClass;
    function &EndTableClass : iModelTable;
  end;

  iModelTableDataSet = interface
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function DataSet (Value : TDataSet) : iModelTableDataSet;
    function CallbackLink(Field : String; MethodName : String) : iModelTableDataSet; overload;
    function CallbackLink(Field : String; MethodName : String; AValue : String) : iModelTableDataSet; overload;
    function Action : iModelTableAction;
    function ActionEdit : iModelTableAction;
    function ActionDelete : iModelTableAction;
    function ResultScript : String;
    function ResultStyle : String;
    function &End : iModelTable;
  end;

  iModelTableActionImage = Interface
    ['{60D2D1F0-B0F7-404D-8681-B9EBE36FFEB2}']
    function Image (Value : TCustomMemoryStream) : iModelTableActionImage; overload;
    function Image (Value : String) : iModelTableActionImage; overload;
    function Width (Value : Integer) : iModelTableActionImage; overload;
    function Height (Value : Integer) : iModelTableActionImage; overload;
    function Tooltip (Value : String) : iModelTableActionImage; overload;
    function Image : String; overload;
    function Width : String; overload;
    function Height : String; overload;
    function Tooltip : String overload;
    function StyleClass : String;
    function &End : iModelTableAction;

  end;

  iModelTableAction = interface
    ['{D9476DEA-F074-4A7B-9472-B7A9872F7023}']
    function ActionHeader (Value : String) : iModelTableAction; overload;
    function Image : iModelTableActionImage;
    function CallbackLink(Field : String; MethodName : String) : iModelTableAction;
    function ActionHeader : String; overload;
    function ImageTag : String;
    function MethodName : String;
    function FieldName : String;
    function ResultStyle : String;
    function &End : iModelTableDataSet;
  end;

  iModelTableOption = interface
    ['{2DFF85D5-1116-4160-AAE4-8A5172B8EFD8}']
    function ScrollCollapse(Value : Boolean) : iModelTableOption; //Permita que a tabela reduza em altura quando um n�mero limitado de linhas for mostrado.
    function Responsive(Value : Boolean) : iModelTableOption; //Habilitar e configurar a extens�o responsiva para DataTables
    function DeferLoading(Value : Integer) : iModelTableOption; //Atraso no carregamento dos dados do servidor at� o segundo sorteio
    function OpDestroy(Value : Boolean) : iModelTableOption; //Destrua qualquer tabela existente que corresponda ao seletor e substitua pelas novas op��es.
    function DisplayStart(Value : Integer) : iModelTableOption; //Ponto inicial de pagina��o inicial
    function LengthMenu(Value : String) : iModelTableOption; //Altere as op��es na selectlista de comprimento da p�gina .
    function Order(Value : String) : iModelTableOption; //Ordem inicial (classifica��o) a ser aplicada � tabela
    function OrderCellsTop(Value : Boolean) : iModelTableOption; //Controlar em qual c�lula o manipulador de eventos do pedido ser� aplicado em uma coluna
    function OrderClasses(Value : Boolean) : iModelTableOption; //Destaque as colunas que est�o sendo ordenadas no corpo da tabela
    function OrderFixed(Value : String) : iModelTableOption; //Ordena��o para sempre ser aplicada � tabela
    function OrderMulti(Value : Boolean) : iModelTableOption; //Controle de capacidade de ordena��o de v�rias colunas.
    function PageLength(Value : Integer) : iModelTableOption; //Alterar o comprimento da p�gina inicial (n�mero de linhas por p�gina)
    function PagingType(Value : String) : iModelTableOption; //Op��es de exibi��o do bot�o de pagina��o
    function Retrieve(Value : Boolean) : iModelTableOption; //Recuperar uma inst�ncia existente do DataTables
    function Name(Value : String) : iModelTableOption; overload;//DOM Id
    function Name: String; overload;//DOM Id
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableFeatures = interface
    ['{3A297833-19EA-46CB-A10D-5AF1905791FC}']
    function AutoWidth(Value : Boolean) : iModelTableFeatures; //Controle de recursos Tratamento de largura de colunas inteligentes do DataTables
    function deferRender(Value : Boolean) : iModelTableFeatures; //Controle diferenciado renderiza��o adiada para velocidade adicional de inicializa��o.
    function Info(Value : Boolean) : iModelTableFeatures; //Campo de exibi��o de informa��es da tabela de controle de recursos
    function LengthChange(Value : Boolean) : iModelTableFeatures; //O recurso controla a capacidade do usu�rio final de alterar o comprimento da exibi��o de pagina��o da tabela.
    function Ordering(Value : Boolean) : iModelTableFeatures; //Recursos de ordena��o de controle de recursos (classifica��o) no DataTables.
    function Paging(Value : Boolean) : iModelTableFeatures; //Ativar ou desativar a pagina��o da tabela
    function Processing(Value : Boolean) : iModelTableFeatures; //O recurso controla o indicador de processamento
    function ScrollX(Value : Boolean) : iModelTableFeatures; //rolagem horizontal
    function ScrollY(Value : Integer) : iModelTableFeatures; //rolagem vertical
    function Searching(Value : Boolean) : iModelTableFeatures; //Recursos de pesquisa (filtragem) de controle de recursos
    function ServerSide(Value : Boolean) : iModelTableFeatures; //Controle de recurso Modo de processamento no lado do servidor do DataTables
    function StateSave(Value : Boolean) : iModelTableFeatures; //Economia de estado - restaura o estado da tabela no recarregamento da p�gina.
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableData = interface
    ['{6241E52E-02AF-4395-B162-6FF6B5821A6C}']
    function Server(Value : String) : iModelTableData;
    function Columns(Value : Array of String) : iModelTableData;
    function JType(Value : String) : iModelTableData;
    function DataSrc(Value : String) : iModelTableData;
    function ResultTable : String;
    function Result : String;
    function &End : iModelTable;
  end;

  iModelTableCallback = interface
    ['{CB685C9B-1FC8-4C23-BECC-BFCBBAA99C37}']
    function formatNumber(aCampo, aFormat : String) : iModelTableCallback;
    function Result : String;
    function &End : iModelTable;
  end;

  IModelHTMLRowsDiv = interface
    ['{BD95F279-9614-47FD-B0AD-56B93279D4F1}']
    function Add(Value : String) : IModelHTMLRowsDiv;
    function ColSpan(Value : Integer) : IModelHTMLRowsDiv;
    function &End : IModelHTMLRows;
  end;

  iModelCards = interface
    ['{5BA3AF40-D673-44BA-BF79-5F35E0F00BFB}']
    function Colors : iModelColors<iModelCards>;
    function DataSet : iModelCardsDataSet;
    function FieldHeader(Value : String) : iModelCards; overload;
    function FieldTitle(Value : String) : iModelCards; overload;
    function FieldBody(Value : String) : iModelCards; overload;
    function FieldHeader : String; overload;
    function FieldTitle : String; overload;
    function FieldBody : String; overload;
    function ColSpan(Value : Integer) : iModelCards; overload;
    function ColSpan : Integer; overload;
    function &End : iModelHTML;
  end;

  iModelCardsDataSet = interface
    ['{E38197FC-8395-45BC-A0DE-D7283DD7E594}']
    function DataSet (Value : TDataSet) : iModelCardsDataSet;
    function ResultScript : String;
    function &End : iModelCards;
  end;

  iCallbackJS = interface
    ['{B3DD9B36-2024-4763-96A3-DEC0F10F454A}']
    function ClassProvider(Value : TObject) : iCallbackJS;
    function &End : iModelHTML;
  end;

  iChartsCallback = interface
  ['{4040F646-6D4F-477A-B5CE-98FDD025DAEB}']
    function Result (Value : String) : String;
    function IDChart ( Value : String) : iChartsCallback;
  end;

  iModelImage = interface
    ['{477D75E4-1BEE-4E4B-B15F-80B92DA186EA}']
    function &End : iModelHTML;
    function ImageClass : iModelImageClass;
    function DataSet : iModelImageDataSet;
  end;

  iModelImageDataSet = interface
    ['{061B2938-6100-42AF-8EE4-D5895E5A38B8}']
    function Field(Value : String) : iModelImageDataSet;
    function DataSet (Value : TDataSet) : iModelImageDataSet;
    function ResultScript : String;
    function &End : iModelImage;
  end;

  iModelImageClass = interface
    ['{9631B98F-CDE7-41A1-8138-E8E05AD72B65}']
    function imgFluid : iModelImageClass;
    function imgThumbnail : iModelImageClass;
    function FloatLeft : iModelImageClass;
    function FloatRight : iModelImageClass;
    function MxAuto : iModelImageClass;
    function DBlock : iModelImageClass;
    function rounded : iModelImageClass;
    function ResultClass : String;
    function &End : iModelImage;
  end;

  iModelButton = interface
    ['{BF6585F7-1823-4604-8FE4-1305EF38833B}']
    function ButtonClass : iModelButtonClass;
    function CallbackLink(Param : String; Method : String) : iModelButton;
    function Title(Value : String) : iModelButton;
    function &End : iModelHTML;
  end;

  iModelButtonClass = interface
  ['{E03B3D3A-2D23-4AC0-86E3-5C4F18B9A9CE}']
    function primary : iModelButtonClass;
    function secondary : iModelButtonClass;
    function success : iModelButtonClass;
    function danger : iModelButtonClass;
    function warning : iModelButtonClass;
    function info : iModelButtonClass;
    function light : iModelButtonClass;
    function dark : iModelButtonClass;
    function outline : iModelButtonClass;
    function small : iModelButtonClass;
    function large : iModelButtonClass;
    function block : iModelButtonClass;
    function active : iModelButtonClass;
    function disabled : iModelButtonClass;
    function ResultClass : String;
    function &End : iModelButton;
  end;

  iModelCSS = interface
    ['{DBC52618-B95B-4871-9BC5-632B7737F2FD}']
    function PackCSS : String;
    function CDN(Value : Boolean) : iModelCSS;
    function BackgroundColor ( Value : String ) :  iModelCSS;
    function FontColor ( Value : String ) : iModelCSS;
    function BorderColor ( Value : String ) : iModelCSS;
  end;

  iModelJS = interface
    ['{CB37AC61-A8D6-4CEB-BFD1-FDC26CDEB2AA}']
    function PackJS : String;
    function CDN(Value : Boolean) : iModelJS;
    function Credenciais(Value : iModelCredenciais) : iModelJS;
  end;

  iModelChartEasyPie = interface
    ['{236E2A17-A50A-4E23-A414-19A1E8A7B34E}']
    function BarColor(Value : String) : iModelChartEasyPie;
    function TrackColor(Value : String) : iModelChartEasyPie;
    function ScaleColor(Value : String) : iModelChartEasyPie;
    function LineCap(Value : String) : iModelChartEasyPie;
    function LinheWidth(Value : String) : iModelChartEasyPie;
    function Size(Value : String) : iModelChartEasyPie;
    function Animate(Value : String) : iModelChartEasyPie;
    function OnStart(Value : String) : iModelChartEasyPie;
    function OnStop(Value : String) : iModelChartEasyPie;
    function OnStep(Value : String) : iModelChartEasyPie;
    function DataPercent(Value : String) : iModelChartEasyPie;
    function &End : iModelHTML;
  end;

  {$ENDIF}

implementation

end.
