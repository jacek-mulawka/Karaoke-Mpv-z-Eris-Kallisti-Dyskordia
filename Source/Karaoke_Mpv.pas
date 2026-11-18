unit Karaoke_Mpv;{28.PaŸ.2026}

  //
  // MIT License
  //
  // Copyright (c) 2026 Jacek Mulawka
  //
  // j.mulawka@interia.pl
  //
  // https://github.com/jacek-mulawka
  //

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Samples.Spin,

  MPVBasePlayer;

type
  TNapis = class( TStaticText )
  private
    { private declarations }
    czas_od,
    czas_do
      : real;
  public
    { public declarations }
    constructor Create( TheOwner : TComponent );
    destructor Destroy(); override;
  end;

  TT³umaczenie_Komunikaty_r = record
    b³¹d,
    domyœlne,
    eryzyjskie,
    multimedia,
    nie_odnaleziono_pliku_,
    nie_odnaleziono_pliku_napisów_,
    nie_odnaleziono_pliku_t³umaczenia_,
    nie_uda³o_siê_wczytaæ__MPV_dll__,
    podgl¹d_napisów,
    pomoc,
    razem_napisów,
    tekstowe,
    wszystkie
      : string;
  end;

  TKaraoke_Mpv_Form = class( TForm )
    PageControl1: TPageControl;
    Opcje_Splitter: TSplitter;
    Opcje_TabSheet: TTabSheet;
    O_Programie_TabSheet: TTabSheet;
    O_Programie_1_Label: TLabel;
    Logo_Image: TImage;
    Pomoc_BitBtn: TBitBtn;
    Sterowanie_TabSheet: TTabSheet;
    Odtwarzaj_Button: TButton;
    Pauza_Button: TButton;
    Stop_Button: TButton;
    Skok_Do__Ty³u_Button: TButton;
    Skok_Do__Przodu_Button: TButton;
    Czas_ProgressBar: TProgressBar;
    G³oœnoœæ_ProgressBar: TProgressBar;
    Ekran_Panel: TPanel;
    Czas_Timer: TTimer;
    Czas__Bie¿¹cy_Label: TLabel;
    Czas__Ca³kowity_Label: TLabel;
    Karaoke_Key_Down_Edit: TEdit;
    Plik__Multimedialny__Otwórz_Button: TButton;
    Plik__Napisy__Otwórz_Button: TButton;
    Przesuniêcie_Napisów_Etykieta_Label: TLabel;
    Przesuniêcie_Napisów_SpinEdit: TSpinEdit;
    Wymiar_Label: TLabel;
    Napisy_Podgl¹d_TabSheet: TTabSheet;
    Napisy_Podgl¹d_Memo: TMemo;
    Linie_Œpiewu_GroupBox: TGroupBox;
    Linie_Œpiewu__Odstêp_Etykieta_Label: TLabel;
    Linie_Œpiewu__Odstêp_SpinEdit: TSpinEdit;
    Linie_Œpiewu__Wielkoœæ_Etykieta_Label: TLabel;
    Linie_Œpiewu__Wielkoœæ_SpinEdit: TSpinEdit;
    Linie_Œpiewu__Pozycja_Etykieta_Label: TLabel;
    Linie_Œpiewu__Pozycja_SpinEdit: TSpinEdit;
    Linie_Œpiewu__Widocznoœæ_CheckBox: TCheckBox;
    Linia_Œpiewu__Góra_StaticText: TStaticText;
    Linia_Œpiewu__Dó³_StaticText: TStaticText;
    Opcje_ScrollBox: TScrollBox;
    T³umaczenie_Etykieta_Label: TLabel;
    T³umaczenie_ComboBox: TComboBox;
    Napisy_GroupBox: TGroupBox;
    Jedno_Uruchomienie_Programu_CheckBox: TCheckBox;
    Ustawienia_GroupBox: TGroupBox;
    Linie_Œpiewu__Kolor_Button: TButton;
    Napisy__Czcionka_Button: TButton;
    Napisy__T³o_Button: TButton;
    Ustawienia__Wczytaj_Button: TButton;
    Ustawienia__Zapisz_Button: TButton;
    Ustawienia__Domyœlne_Button: TButton;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    Systemowy_Timer: TTimer;
    OpenDialog1: TOpenDialog;
    E_Mail_LinkLabel: TLinkLabel;
    Www_LinkLabel: TLinkLabel;
    O_Programie_2_Label: TLabel;
    W_Projekcie_Wykorzystano_Label: TLabel;
    LibMPVDelphi_LinkLabel: TLinkLabel;
    Mpv_Player_Windows_Files_LinkLabel: TLinkLabel;
    Mpv_LinkLabel: TLinkLabel;
    Program_Do_Dzia³ania_Potrzebuje_Label: TLabel;
    Program_Do_Dzia³ania_Potrzebuje___T³umaczenie_Label: TLabel;
    O_Programie_ScrollBox: TScrollBox;
    G³oœnoœæ_Label: TLabel;
    Pomoc_TabSheet: TTabSheet;
    Pomoc_Memo: TMemo;
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure Karaoke_KeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure Karaoke_Key_Down_Set_Focus( Sender: TObject );
    procedure Karaoke_MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );

    //FormMouseWheel - zg³asza b³êdy dostêpu (access violation).
    procedure FormMouseWheelDown( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
    procedure FormMouseWheelUp( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );

    procedure Czas_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Czas_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Czas_TimerTimer( Sender: TObject );
    procedure Ekran_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Ekran_PanelMouseUp( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Ekran_PanelResize( Sender: TObject );
    procedure G³oœnoœæ_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure G³oœnoœæ_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Linie_Œpiewu__Kolor_ButtonClick( Sender: TObject );
    procedure Linie_Œpiewu__Widocznoœæ_CheckBoxClick( Sender: TObject );
    procedure LinkLabelLinkClick( Sender: TObject; const Link: string; LinkType: TSysLinkType );
    procedure Napisy__Czcionka_T³o_ButtonClick( Sender: TObject );
    procedure Odtwarzaj_ButtonClick( Sender: TObject );
    procedure Pauza_ButtonClick( Sender: TObject );
    procedure Plik__Do_Uruchomienia__Dopisz();
    procedure Plik__Multimedialny__Otwórz_ButtonClick( Sender: TObject );
    procedure Plik__Napisy__Otwórz_ButtonClick( Sender: TObject );
    procedure Pomoc_BitBtnClick( Sender: TObject );
    procedure Skok_Do__Przodu_ButtonClick( Sender: TObject );
    procedure Skok_Do__Ty³u_ButtonClick( Sender: TObject );
    procedure Stop_ButtonClick( Sender: TObject );
    procedure Systemowy_TimerTimer( Sender: TObject );
    procedure T³umaczenie_ComboBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure Ustawienia__Domyœlne_ButtonClick( Sender: TObject );
    procedure Ustawienia__Wczytaj_Zapisz_ButtonClick( Sender: TObject );
  private
    { Private declarations }
    mysz__przycisk_naciœniêty_g,
    zamykanie_g
      : boolean;

    karaoke_handle_g : THandle;

    mysz__kursor__ruch__ukrywanie__czas_sekundy_g,
    mysz__przycisk_naciœniêty__x__start_g,
    mysz__przycisk_naciœniêty__y__start_g,
    napisy__odœwie¿anie_milisekundy_g
      : integer;

    czas_aktualny_milisekundy_g,
    czas__skok__du¿y_sekundy_g,
    czas__skok__ma³y_sekundy_g,
    czas__skok__minimalny_sekundy_g,
    czas__skok__œredni_sekundy_g,
    g³oœnoœæ__poziom__domyœlny_g,
    g³oœnoœæ__poziom__maksymalny_g,
    g³oœnoœæ__poziom__minimalny_g,
    g³oœnoœæ__skok__du¿y_g,
    g³oœnoœæ__skok__ma³y_g,
    napisy__korekta_intensywnoœæ_g,
    napisy__synchronizacja_ponad_milisekundy_g
      : double;

    plik_adres__multimedialny_g,
    plik_adres__napisy_g,
    pliki__multimedialne_rozszerzenia_g,
    pliki__multimedialne_rozszerzenia__t³umaczenie_g,
    pliki__napisów_rozszerzenia_g,
    pliki__napisów_rozszerzenia__t³umaczenie_g,
    pomoc_memo_tekst_kopia_g
      : string;

    mysz__kursor__ruch__ostatni__data_czas_g : TDateTime;
    mysz__kursor__ruch__ostatni__pozycja_g : TPoint;

    t³umaczenie_komunikaty_r : TT³umaczenie_Komunikaty_r;

    napisy_t : array of TNapis;

    mpv_base_player_g : MPVBasePlayer.TMPVBasePlayer;

    procedure MPV_Progress_Event( cSender: TObject; fCurSec, fTotalSec: Double );
    procedure MPV_State_Changed( cSender: TObject; eState: TMPVPlayerState );

    procedure WMDropFiles( var Msg : TWMDropFiles ); message WM_DROPFILES;

    procedure Czas_Pasek_Click( const pozycja_f : integer );
    procedure Czas_Timer_Enabled_Ustaw();
    procedure Czas__Aktualny_Ustaw();
    procedure Czas__Postêp_Wyœwietl( const czas__bie¿¹cy_sekundy_f, czas__ca³kowity_sekundy_f : double );
    procedure G³oœnoœæ__Pasek__Click( const pozycja_f : integer );
    procedure G³oœnoœæ__Pasek__Ustaw();
    procedure G³oœnoœæ__Ustaw( wartoœæ_f : double );
    procedure G³oœnoœæ__Zmieñ( const wartoœæ_f : double; const wycisz_f : boolean = false );
    procedure Informacja_Tekst_Wyœwietl( const napis_f : string; const wyœwietlanie_czas_f : integer = 1000 );
    function Linie_Œpiewu__Odstêp_Okreœl() : integer;
    function Linie_Œpiewu__Pozycja_Okreœl() : integer;
    procedure Mysz__Przycisk_Naciœniêty__Procent_Wylicz( const x_f, y_f : integer; const ustaw_f : boolean = false );
    procedure Napisy__Czcionka_Ustaw( napis_f : TNapis );
    procedure Napisy__Czcionka_Ustaw__Wszystkie();
    function Napis__Pozycja_Ustal( napis : TNapis; const czas_filmu_aktualny_milisekundy_f : double ) : integer;
    procedure Napisy__Przelicz( const czas_filmu_aktualny_milisekundy_f : double );
    procedure Napisy__Wczytaj( const adres_pliku_f : string );
    procedure Napisy__Zwolnij();
    procedure Opcje_Panel_Ustaw( const ukryj_f : boolean = false );
    procedure Pauza();
    procedure Pe³ny_Ekran( const wy³¹cz_pe³ny_ekran_f : boolean = false );
    procedure Plik__Multimedialny__Otwórz( const adres_pliku_f : string; const napisy_szukaj_f : boolean = true );
    function Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz( const adres_pliku_f : string ) : boolean;
    procedure Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz( adres_pliku_f : string );
    function Sekundy_W_Czas_Trwania( czas_sekundy_f : double ) : string;
    procedure Skok_Do__Przodu( const sekundy_f : double = 3 );
    procedure Skok_Do__Ty³u( const sekundy_f : double = 3 );
    procedure T³umaczenia__Domyœlne();
    procedure T³umaczenia__Lista__Wczytaj();
    procedure T³umaczenia__Zastosuj();
    procedure T³umaczenia__Zastosuj__Dodatkowe();
    function Ustawienia__Wczytaj_Zapisz( const zapisz_f : boolean; const konfiguracja__tylko_f : boolean = false ) : double;
  public
    { Public declarations }
  end;

const
  czas__pasek_skala_c : double = 1000;
  mpv__opcja__brak_napisów_c : string = 'no';
  panel_boczny_szerokoœæ_c : integer = 130;
  plik__ini_nazwa_c : string = 'Karaoke_Mpv.ini';
  plik__skojarzenie_nazwa_c : string = 'Karaoke_Mpv_plik';
  pomoc_o_programie__plik__nazwa_c : string = 'Karaoke_Mpv - pomoc.txt';
  t³umaczenia__katalog__nazwa_c : string = 'T³umaczenia';
  t³umaczenie__s³owo__multimedia_c : string = '__multimedia__';
  t³umaczenie__s³owo__eryzyjskie_c : string = '__eryzyjskie__';
  t³umaczenie__s³owo__tekstowe_c : string = '__tekstowe__';
  t³umaczenie__s³owo__wszystkie_c : string = '__wszystkie__';
  t³umaczenie__wyró¿nik__domyœlne_c : string = '<';

var
  Karaoke_Mpv_Form: TKaraoke_Mpv_Form;

implementation

uses
  System.DateUtils,
  System.IniFiles,
  System.IOUtils,
  System.Math,
  System.Rtti,
  System.StrUtils,
  System.TypInfo,
  Winapi.ShellAPI;

{$R *.dfm}

//      ***      Funkcje      ***      //

procedure TKaraoke_Mpv_Form.MPV_Progress_Event( cSender: TObject; fCurSec, fTotalSec: Double );
begin
//
end;//---//Funkcja MPV_Progress_Event().

procedure TKaraoke_Mpv_Form.MPV_State_Changed( cSender: TObject; eState: TMPVPlayerState );
begin

  if mpv_base_player_g = nil then
    Exit;


  Czas_Timer_Enabled_Ustaw();

end;//---//Funkcja MPV_State_Changed().

procedure TKaraoke_Mpv_Form.WMDropFiles( var Msg : TWMDropFiles );
var
  i,
  zti
    : integer;
  zts,
  plik_adres__multimedialny_l,
  plik_adres__napisy_l
    : string;
  adres_pliku_l : array[ 0..MAX_PATH ] of Char;
begin

  //https://stackoverflow.com/questions/16649442/how-do-i-allow-dragging-files-for-specific-controls-in-delphi

  plik_adres__multimedialny_l := '';
  plik_adres__napisy_l := '';

  try
    zti := DragQueryFile( Msg.Drop, $FFFFFFFF, nil, 0 );

    for i := 0 to zti - 1 do
      begin

        DragQueryFile( Msg.Drop, i, adres_pliku_l, MAX_PATH );

        zts := AnsiLowerCase(  ExtractFileExt( adres_pliku_l )  );

        if    (  Trim( adres_pliku_l ) <> ''  )
          and (  Trim( zts ) <> ''  ) then
          begin

            if    ( plik_adres__multimedialny_l = '' )
              and (  Pos( '.esama_karaoke', zts ) <= 0  )
              and (  Pos( '.exe', zts ) <= 0  )
              and (  Pos( '.srt', zts ) <= 0  )
              and (  Pos( '.txt', zts ) <= 0  )
              and (  FileExists( adres_pliku_l )  ) then
              plik_adres__multimedialny_l := adres_pliku_l;


            if    ( plik_adres__napisy_l = '' )
              and (
                       (  Pos( '.esama_karaoke', zts ) > 0  )
                    or (  Pos( '.srt', zts ) > 0  )
                    or (  Pos( '.txt', zts ) > 0  )
                  )
              and (  FileExists( adres_pliku_l )  ) then
              plik_adres__napisy_l := adres_pliku_l;

          end;
        //---//if    (  Trim( adres_pliku_l ) <> ''  ) (...)


        if    (  Trim( plik_adres__multimedialny_l ) <> ''  )
          and (  Trim( plik_adres__napisy_l ) <> ''  ) then
          Break;

      end;
  finally
    DragFinish( Msg.Drop );
  end;
  //--//try


  Msg.Result := 0;


  if Trim( plik_adres__multimedialny_l ) <> '' then
    Plik__Multimedialny__Otwórz(  plik_adres__multimedialny_l, Trim( plik_adres__napisy_l ) = ''  );

  if Trim( plik_adres__napisy_l ) <> '' then
    begin

      Napisy__Wczytaj( plik_adres__napisy_l );

      if Trim( plik_adres__multimedialny_l ) = '' then
        Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz( plik_adres__napisy_l );

    end;
  //---//if Trim( plik_adres__napisy_l ) <> '' then

end;//---//Funkcja WMDropFiles().

procedure TKaraoke_Mpv_Form.Czas_Pasek_Click( const pozycja_f : integer );
var
  zti : integer;
  procent : real;
begin

  if   ( mpv_base_player_g = nil )
    or (  not ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )  ) then
    Exit;


  if Czas_ProgressBar.Width <= 0 then
    begin

      mpv_base_player_g.Seek( 0, false );

      Exit;

    end;
  //---//if Czas_ProgressBar.Width <= 0 then


  zti := Czas_ProgressBar.Width;

  if zti <= 0 then
    zti := 1;

  procent := 100 * pozycja_f / zti;


  if procent < 0 then
    procent := 0
  else
  if procent > 100 then
    procent := 100;

  procent := procent / 100;


  mpv_base_player_g.Seek( mpv_base_player_g.TotalSeconds * procent, false );

end;//---//Funkcja Czas_Pasek_Click().

procedure TKaraoke_Mpv_Form.Czas_Timer_Enabled_Ustaw();
begin

  if mpv_base_player_g <> nil then
    Czas_Timer.Enabled :=
          ( not zamykanie_g )
      and ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )
  else
    Czas_Timer.Enabled := false;

end;//---//Funkcja Czas_Timer_Enabled_Ustaw();

procedure TKaraoke_Mpv_Form.Czas__Aktualny_Ustaw();
begin

  if mpv_base_player_g <> nil then
    czas_aktualny_milisekundy_g := mpv_base_player_g.CurrentSeconds * 1000
  else
    czas_aktualny_milisekundy_g := 0;

end;//---//Funkcja Czas__Aktualny_Ustaw().

procedure TKaraoke_Mpv_Form.Czas__Postêp_Wyœwietl( const czas__bie¿¹cy_sekundy_f, czas__ca³kowity_sekundy_f : double );
begin

  Czas__Bie¿¹cy_Label.Caption := Sekundy_W_Czas_Trwania( czas__bie¿¹cy_sekundy_f );
  Czas__Ca³kowity_Label.Caption := Sekundy_W_Czas_Trwania( czas__ca³kowity_sekundy_f );

  Czas_ProgressBar.Position := System.Math.Floor( czas__bie¿¹cy_sekundy_f * czas__pasek_skala_c );

end;//---//Czas__Postêp_Wyœwietl().

procedure TKaraoke_Mpv_Form.G³oœnoœæ__Pasek__Click( const pozycja_f : integer );
var
  ztdo : double;

  procent : real;
begin

  if mpv_base_player_g = nil then
    Exit;


  if G³oœnoœæ_ProgressBar.Width <= 0 then
    begin

      mpv_base_player_g.SetVolume( g³oœnoœæ__poziom__minimalny_g );

      Informacja_Tekst_Wyœwietl(  FloatToStr( mpv_base_player_g.GetVolume() ) + ' %'  );

      Exit;

    end;
  //---//if G³oœnoœæ_ProgressBar.Width <= 0 then


  ztdo := G³oœnoœæ_ProgressBar.Width;

  if ztdo <= 0 then
    ztdo := 1;

  procent := 100 * pozycja_f / ztdo;


  if procent < 0 then
    procent := 0;

  if procent > 100 then
    procent := 100;

  procent := procent / 100;

  ztdo := g³oœnoœæ__poziom__maksymalny_g * procent;

  if ztdo < g³oœnoœæ__poziom__minimalny_g then
    ztdo := g³oœnoœæ__poziom__minimalny_g
  else
  if ztdo > g³oœnoœæ__poziom__maksymalny_g then
    ztdo := g³oœnoœæ__poziom__maksymalny_g;


  mpv_base_player_g.SetVolume( ztdo );


  G³oœnoœæ__Pasek__Ustaw();

end;//---//Funkcja G³oœnoœæ__Pasek__Click().

procedure TKaraoke_Mpv_Form.G³oœnoœæ__Pasek__Ustaw();
var
  g³oœnoœæ_poziom_l,
  g³oœnoœæ_procent_l
    : double;
begin

  if mpv_base_player_g = nil then
    Exit;


  g³oœnoœæ_poziom_l := mpv_base_player_g.GetVolume();


  g³oœnoœæ_procent_l := g³oœnoœæ__poziom__maksymalny_g / 100;

  if g³oœnoœæ_procent_l = 0 then
    g³oœnoœæ_procent_l := 1;


  g³oœnoœæ_procent_l := g³oœnoœæ_poziom_l / g³oœnoœæ_procent_l;

  G³oœnoœæ_ProgressBar.Position := Round( g³oœnoœæ_procent_l );

  G³oœnoœæ_Label.Caption := FloatToStr(  Round( g³oœnoœæ_poziom_l )  ) + ' (' + FloatToStr( G³oœnoœæ_ProgressBar.Position ) + ' %)';


  Informacja_Tekst_Wyœwietl( G³oœnoœæ_Label.Caption );

end;//---//Funkcja G³oœnoœæ__Pasek__Ustaw().

procedure TKaraoke_Mpv_Form.G³oœnoœæ__Ustaw( wartoœæ_f : double );
begin

  if mpv_base_player_g = nil then
    Exit;


  if wartoœæ_f < g³oœnoœæ__poziom__minimalny_g then
    wartoœæ_f := g³oœnoœæ__poziom__minimalny_g
  else
  if wartoœæ_f > g³oœnoœæ__poziom__maksymalny_g then
    wartoœæ_f := g³oœnoœæ__poziom__maksymalny_g;

  mpv_base_player_g.SetVolume( wartoœæ_f );


  G³oœnoœæ__Pasek__Ustaw();

end;//---//Funkcja G³oœnoœæ__Pasek__Ustaw().

procedure TKaraoke_Mpv_Form.G³oœnoœæ__Zmieñ( const wartoœæ_f : double; const wycisz_f : boolean = false );
var
  ztb : boolean;

  ztdo : double;
begin

  if mpv_base_player_g = nil then
    Exit;


  if wycisz_f then
    begin

      ztb := mpv_base_player_g.Mute;

      //ztb := mpv_base_player_g.GetMute();
      mpv_base_player_g.SetMute( not ztb );


      if not ztb then // Po ustawieniu wartoœci s¹ jakieœ opóŸnienia i gdy siê od razu odczytuje stan to przekazuje poprzedni¹ wartoœæ.
        begin

          G³oœnoœæ_ProgressBar.State := pbsPaused;

          Informacja_Tekst_Wyœwietl( 'Wycisz' );

        end
      else//if not ztb then
        begin

          G³oœnoœæ_ProgressBar.State := pbsNormal;

          G³oœnoœæ__Pasek__Ustaw();

        end;
      //---//if not ztb then


      Exit;

    end;
  //---//if wycisz_f then


  if G³oœnoœæ_ProgressBar.State <> pbsNormal then
    G³oœnoœæ_ProgressBar.State := pbsNormal;


  ztdo := mpv_base_player_g.GetVolume();

  ztdo := ztdo + wartoœæ_f;

  if ztdo < g³oœnoœæ__poziom__minimalny_g then
    ztdo := g³oœnoœæ__poziom__minimalny_g
  else
  if ztdo > g³oœnoœæ__poziom__maksymalny_g then
    ztdo := g³oœnoœæ__poziom__maksymalny_g;

  mpv_base_player_g.SetVolume( ztdo );


  G³oœnoœæ__Pasek__Ustaw();

end;//---//Funkcja G³oœnoœæ__Zmieñ().

procedure TKaraoke_Mpv_Form.Informacja_Tekst_Wyœwietl( const napis_f : string; const wyœwietlanie_czas_f : integer = 1000 );
begin

  if mpv_base_player_g = nil then
    Exit;


  mpv_base_player_g.ShowText( napis_f, wyœwietlanie_czas_f );

end;//---//Funkcja Informacja_Tekst_Wyœwietl().

function TKaraoke_Mpv_Form.Linie_Œpiewu__Odstêp_Okreœl() : integer;
begin

  if Linie_Œpiewu__Odstêp_SpinEdit.Value < 0 then
    Linie_Œpiewu__Odstêp_SpinEdit.Value := 0;


  Result := Round( Ekran_Panel.Height * Linie_Œpiewu__Odstêp_SpinEdit.Value * 0.01 );

end;//---//Funkcja Linie_Œpiewu__Odstêp_Okreœl().

function TKaraoke_Mpv_Form.Linie_Œpiewu__Pozycja_Okreœl() : integer;
begin

  Result := Round( Ekran_Panel.Height * Linie_Œpiewu__Pozycja_SpinEdit.Value * 0.01 );

end;//---//Funkcja Linie_Œpiewu__Pozycja_Okreœl().

procedure TKaraoke_Mpv_Form.Mysz__Przycisk_Naciœniêty__Procent_Wylicz( const x_f, y_f : integer; const ustaw_f : boolean = false );
var
  czy_minus,
  czy_poziom
    : boolean;

  czas_aktualny_procent_l,
  czas__po_zmianie,
  ruch__pion_wartoœæ,
  ruch__poziom_procent,
  wartoœæ__ró¿nica
    : double;

  zts : string;
begin

  if   ( Ekran_Panel.Height = 0 )
    or ( Ekran_Panel.Width = 0 )
    or ( mpv_base_player_g = nil ) then
    Exit;


  ruch__pion_wartoœæ :=
      mpv_base_player_g.GetVolume()
    + 100 * ( mysz__przycisk_naciœniêty__y__start_g - y_f ) / Ekran_Panel.Height;

  if ruch__pion_wartoœæ < g³oœnoœæ__poziom__minimalny_g then
    ruch__pion_wartoœæ := g³oœnoœæ__poziom__minimalny_g
  else
  if ruch__pion_wartoœæ > g³oœnoœæ__poziom__maksymalny_g then
    ruch__pion_wartoœæ := g³oœnoœæ__poziom__maksymalny_g;


  if mpv_base_player_g.TotalSeconds <> 0 then
    czas_aktualny_procent_l := 100 * mpv_base_player_g.CurrentSeconds / mpv_base_player_g.TotalSeconds
  else
    czas_aktualny_procent_l := 0;

  ruch__poziom_procent :=
      czas_aktualny_procent_l
    + (  100 * ( x_f - mysz__przycisk_naciœniêty__x__start_g ) / Ekran_Panel.Width  )
    * 0.5;

  if ruch__poziom_procent < 0 then
    ruch__poziom_procent := 0
  else
  if ruch__poziom_procent > 100 then
    ruch__poziom_procent := 100;

  czas__po_zmianie := ruch__poziom_procent * mpv_base_player_g.TotalSeconds * 0.01;


  czy_poziom := Abs( mysz__przycisk_naciœniêty__x__start_g - x_f ) > Abs( mysz__przycisk_naciœniêty__y__start_g - y_f );


  if ustaw_f then
    begin

      if czy_poziom then
        begin

          if   ( mysz__przycisk_naciœniêty__x__start_g = x_f )
            or (  not ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )  )
            or ( mpv_base_player_g.TotalSeconds <= 0 ) then
            Exit;


          mpv_base_player_g.Seek( czas__po_zmianie, false );


          Informacja_Tekst_Wyœwietl(  Sekundy_W_Czas_Trwania( czas__po_zmianie )  ); // Aby ukryæ d³ugo wyœwietlany napis.

        end
      else//if czy_poziom then
        begin

          if mysz__przycisk_naciœniêty__y__start_g = y_f then
            begin

              G³oœnoœæ__Pasek__Ustaw(); // Aby ukryæ d³ugo wyœwietlany napis.

              Exit;

            end;
          //---//if mysz__przycisk_naciœniêty__y__start_g = y_f then


          G³oœnoœæ__Ustaw( ruch__pion_wartoœæ );

        end;
      //---//if czy_poziom then

    end
  else//if ustaw_f then
    if czy_poziom then
      begin

        wartoœæ__ró¿nica := mpv_base_player_g.CurrentSeconds;

        wartoœæ__ró¿nica := czas__po_zmianie - wartoœæ__ró¿nica;

        czy_minus := wartoœæ__ró¿nica < 0;

        wartoœæ__ró¿nica := Abs( wartoœæ__ró¿nica );


        zts := Sekundy_W_Czas_Trwania( wartoœæ__ró¿nica );

        if czy_minus then
          zts := '-' + zts
        else//if czy_minus then
          zts := '+' + zts;


        zts := zts +
          ' (' + Sekundy_W_Czas_Trwania( czas__po_zmianie ) + ' / ' +
          Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__poziom_procent )  ) + '%)';

        Informacja_Tekst_Wyœwietl( zts, 10000 );

      end
    else//if czy_poziom then
      begin

        wartoœæ__ró¿nica := mpv_base_player_g.GetVolume();

        wartoœæ__ró¿nica := ruch__pion_wartoœæ - wartoœæ__ró¿nica;

        czy_minus := wartoœæ__ró¿nica < 0;

        wartoœæ__ró¿nica := Abs( wartoœæ__ró¿nica );

        if g³oœnoœæ__poziom__maksymalny_g <> 0 then
          czas__po_zmianie := 100 * ruch__pion_wartoœæ / g³oœnoœæ__poziom__maksymalny_g // Tutaj jako wartoœæ po zmianie wyra¿ona w procentach.
        else
          czas__po_zmianie := 0;


        zts := FloatToStr(  Round( wartoœæ__ró¿nica )  );

        if czy_minus then
          zts := '-' + zts
        else//if czy_minus then
          zts := '+' + zts;


        zts := zts +
          ' (' + FloatToStr(  Round( ruch__pion_wartoœæ )  ) + ' / ' +
          Trim(  FormatFloat( '### ### ### ### ##0.00', czas__po_zmianie )  ) + '%)';

        Informacja_Tekst_Wyœwietl( zts, 10000 );

      end;
    //---//if czy_poziom then

end;//---//Funkcja Mysz__Przycisk_Naciœniêty__Procent_Wylicz().

procedure TKaraoke_Mpv_Form.Napisy__Czcionka_Ustaw( napis_f : TNapis );
begin

  if napis_f = nil then
    Exit;


  Wymiar_Label.Caption := napis_f.Caption;


  napis_f.Color := Wymiar_Label.Color;
  napis_f.Font := Wymiar_Label.Font;
  napis_f.Height := Wymiar_Label.Height;
  napis_f.Width := Wymiar_Label.Width;

end;//---//Funkcja Napisy__Czcionka_Ustaw().

procedure TKaraoke_Mpv_Form.Napisy__Czcionka_Ustaw__Wszystkie();
var
  i : integer;
begin

  Screen.Cursor := crHourGlass;


  Wymiar_Label.Visible := true;

  for i := 0 to Length( napisy_t ) - 1 do
    if napisy_t[ i ] <> nil then
      Napisy__Czcionka_Ustaw( napisy_t[ i ] );

  Wymiar_Label.Visible := false;


  Screen.Cursor := crDefault;

end;//---//Funkcja Napisy__Czcionka_Ustaw__Wszystkie().

function TKaraoke_Mpv_Form.Napis__Pozycja_Ustal( napis : TNapis; const czas_filmu_aktualny_milisekundy_f : double ) : integer;
var
  przesuniecie_do_okna,
  prêdkoœæ_napisu
    : integer;

  czas_trwania_napisu : real;
begin

  // czas * prêdkosæ - czas start * prêdkosæ + wysokoœæ start

  if napis = nil then
    Exit;

  Result := -100;


  czas_trwania_napisu := ( napis.czas_do - napis.czas_od ) * 0.001;

  if czas_trwania_napisu <= 0 then
    czas_trwania_napisu := 1;

  prêdkoœæ_napisu := Round(  ( 2 * Linie_Œpiewu__Odstêp_Okreœl() + napis.Height + Linia_Œpiewu__Dó³_StaticText.Height ) / czas_trwania_napisu  );

  if prêdkoœæ_napisu <= 0 then
    prêdkoœæ_napisu := 1;


  // D -> G.
  przesuniecie_do_okna := Ekran_Panel.Top + Round( Ekran_Panel.Height * 0.5 + Linie_Œpiewu__Odstêp_Okreœl() ) - Linie_Œpiewu__Pozycja_Okreœl() + Linia_Œpiewu__Dó³_StaticText.Height;

  Result :=
      przesuniecie_do_okna
    - Round
      (
        (
            czas_filmu_aktualny_milisekundy_f * prêdkoœæ_napisu
          - napis.czas_od * prêdkoœæ_napisu
          + Przesuniêcie_Napisów_SpinEdit.Value * prêdkoœæ_napisu
        )
        * 0.001
      );

end;//---//Funkcja Napis__Pozycja_Ustal().

procedure TKaraoke_Mpv_Form.Napisy__Przelicz( const czas_filmu_aktualny_milisekundy_f : double );
var
  czy_ukryæ_napis : boolean;

  i,
  j
    : integer;
begin

  for i := 0 to Length( napisy_t ) - 1 do
    if napisy_t[ i ] <> nil then
      begin

        j := Napis__Pozycja_Ustal( napisy_t[ i ], czas_filmu_aktualny_milisekundy_f );


        if   ( j <= 0 )
          or ( j <= Ekran_Panel.Top ) then
          czy_ukryæ_napis := true
        else
          czy_ukryæ_napis := false;


        if   ( czy_ukryæ_napis )
          or ( j >= Self.Height )
          or ( j >= Ekran_Panel.Top + Ekran_Panel.Height ) then
          begin

            napisy_t[ i ].Visible := false;
            napisy_t[ i ].Top := -100;

          end
        else//if   ( czy_ukryæ_napis ) (...)
          begin

            napisy_t[ i ].Visible := true;
            napisy_t[ i ].Top := j;

          end;
        //---//if   ( czy_ukryæ_napis ) (...)



        if napisy_t[ i ].Visible then
          napisy_t[ i ].Left := Round(  ( Ekran_Panel.Width - napisy_t[ i ].Width ) * 0.5  );

      end;
    //---//if napisy_t[ i ] <> nil then

end;//---//Funkcja Napisy__Przelicz().

procedure TKaraoke_Mpv_Form.Napisy__Wczytaj( const adres_pliku_f : string );

  //Funkcja Dekoduj_Napis_Do_Znaku() w Napisy__Wczytaj().
  function Dekoduj_Napis_Do_Znaku( napis, znak : string ) : string;
  var
    i : integer;
  begin

    Result := '0';

    for i := 1 to Length( napis ) do
      if napis[ i ] = znak then
        Exit
      else//if napis[ i ] = znak then
        //if CharInSet( napis[ i ], [ 0...9 ] ) then
        if CharInSet( napis[ i ], [ '0' .. '9'] ) then
          Result := Result + napis[ i ];

  end;//---//Funkcja Dekoduj_Napis_Do_Znaku() w Napisy__Wczytaj().

var
  czy_byla_liczba,
  czy_dodac_napis
    : boolean;

  i,
  zti
    : integer;
  czas_od,
  czas_do
    : real;

  zts,
  zts_1
    : string;

  zt_string_list_l : TStringList;
begin//Funkcja Napisy__Wczytaj().

  //
  // Format napisów:
  //
  //0
  //00:00:00,001 --> 00:00:00,002
  //przesuniêcie napisów=000
  //ukrywanie napisów=dó³ / góra / brak
  //
  //0
  //00:00:20,000 --> 00:00:42,000
  //abc def
  //123 ghi
  //
  //0 - liczba
  //00:00:20,000 --> 00:00:42,000 - czas od do (gg:mm:ss,sss)
  //abc def - napisy
  //123 ghi - napisy
  //


  Informacja_Tekst_Wyœwietl( 'Otwórz napisy' );


  Napisy__Zwolnij();


  if Trim( adres_pliku_f ) = '' then
    Exit;


  if not FileExists( adres_pliku_f ) then
    begin

      Application.MessageBox( PChar(t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_napisów_ + #13 + #13 + adres_pliku_f), PChar(t³umaczenie_komunikaty_r.b³¹d), MB_OK + MB_ICONEXCLAMATION );
      Exit;

    end;
  //---//if not FileExists( adres_pliku_f ) then


  plik_adres__napisy_g := adres_pliku_f;


  Screen.Cursor := crHourGlass;


  zt_string_list_l := TStringList.Create();
  zt_string_list_l.LoadFromFile( adres_pliku_f, TEncoding.UTF8 );


  zt_string_list_l.Add( '0' ); // Aby ostatni napis siê doda³.

  czy_byla_liczba := false;
  czy_dodac_napis := false;
  czas_od := -1;
  czas_do := -1;

  Napisy_Podgl¹d_Memo.Lines.Clear();

  Wymiar_Label.Visible := true;

  // Ustawia przesuniêcie napisów.
  zts := '';
  zti := 0;

  if zt_string_list_l.Count >= 3 then
    zts := zt_string_list_l[ 2 ]; // Trzecia linijka.

  i := Pos( 'przesuniêcie napisów=', zts );

  if i > 0 then
    begin

      i := Pos( '=', zts );

      Delete( zts, 1, i );

      try
        Przesuniêcie_Napisów_SpinEdit.Value := StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbê.
        zti := 3;
      except
      end;
      //---//try

    end
  else//if i > 0 then
    if Przesuniêcie_Napisów_SpinEdit.Value <> 0 then
      Przesuniêcie_Napisów_SpinEdit.Value := 0; // Je¿eli nie zdefiniowano przesuniêcia napisów wyzeruje gdyby wczeœniej zosta³o zmienione.
  //---// Ustawia przesuniêcie napisów.


  // Ustawia ukrywanie napisów.
  zts := '';

  if zt_string_list_l.Count >= 4 then
    zts := zt_string_list_l[ 3 ]; // Czwarta linijka.

  i := Pos( 'ukrywanie napisów=', zts ); // Nie jest obs³ugiwane.

  if i > 0 then
    begin

      inc( zti ); // 4.

    end;
  //---//if i > 0 then
  //---// Ustawia ukrywanie napisów.


  for i := zti to zt_string_list_l.Count - 1 do
    begin

      // Na pocz¹tku pierwszej linijki pliku utf-8 jest jakiœ znaczek i lepiej daæ pierwsz¹ linijkê pust¹.
      zts := zt_string_list_l[ i ];


      if not czy_byla_liczba then
        begin

          try
            StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbê.
            czy_byla_liczba := true;
          except
          end;
          //---//try

        end
      else//if not czy_byla_liczba then
        begin

          // By³a liczba.

          if    ( czas_od = -1 )
            and ( czas_do = -1 ) then
            begin

              if Pos( ' --> ', zts ) > 0 then
                begin

                  // Wiersz czasu.

                  czas_od := 0;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_od := 60 * 60 * StrToInt( zts_1 ); // gg.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_od := czas_od + 60 * StrToInt( zts_1 ); // mm.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ',' );
                  Delete( zts, 1, Pos( ',', zts )  );

                  czas_od := czas_od + StrToInt( zts_1 ); // ss.

                  czas_od := czas_od * 1000;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ' ' );
                  Delete( zts, 1, Pos( ' ', zts )  );

                  czas_od := czas_od + StrToInt( zts_1 ); // ,sss.

                  Delete( zts, 1, Pos( '>', zts )  );
                  zts := Trim( zts );


                  czas_do := 0;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_do := 60 * 60 * StrToInt( zts_1 ); // gg.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_do := czas_do + 60 * StrToInt( zts_1 ); // mm.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ',' );
                  Delete( zts, 1, Pos( ',', zts )  );

                  czas_do := czas_do + StrToInt( zts_1 ); // ss.

                  czas_do := czas_do * 1000;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ' ' );
                  Delete( zts, 1, Pos( ' ', zts )  );

                  czas_do := czas_do + StrToInt( zts_1 ); // ,sss.

                  zts_1 := '';

                end;
              //---//if Pos( ' --> ', zts ) > 0 then

            end
          else//if    ( czas_od = -1 ) (...)
            begin

              // Wiersze tekstu.

              try
                StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbê.
                czy_dodac_napis := true;
              except
                czy_dodac_napis := false;
              end;
              //---//try

              if not czy_dodac_napis then
                begin

                  // Je¿eli w wierszu nie ma liczby - sk³ada napisy.

                  if zts <> '' then
                    begin

                      if zts_1 <> '' then
                        zts_1 := zts_1 + #13;

                      zts_1 := zts_1 + zts;

                    end;
                  //---//if zts <> '' then

                end
              else//if not czy_dodac_napis then
                begin

                // Je¿eli w wierszu jest liczba - tworzy kolejny napis.

                zti := Length( napisy_t );
                SetLength( napisy_t, zti + 1 );


                napisy_t[ zti ] := TNapis.Create( Application );
                napisy_t[ zti ].Parent := Self;
                napisy_t[ zti ].Name := 'napisy_' + IntToStr( zti ) + '_Napis';
                napisy_t[ zti ].Visible := false;

                Application.ProcessMessages();

                napisy_t[ zti ].czas_od := czas_od; // W ms.
                napisy_t[ zti ].czas_do := czas_do; // W ms.

                napisy_t[ zti ].BringToFront();

                napisy_t[ zti ].AutoSize := false;
                napisy_t[ zti ].ParentColor := false;
                napisy_t[ zti ].Transparent := false;

                napisy_t[ zti ].Caption := zts_1;
                napisy_t[ zti ].Left := 0;
                napisy_t[ zti ].Top := -100;


                napisy_t[ zti ].OnMouseDown := Ekran_PanelMouseDown;
                napisy_t[ zti ].OnMouseUp := Ekran_PanelMouseUp;
                napisy_t[ zti ].OnMouseMove := Karaoke_MouseMove;


                Napisy__Czcionka_Ustaw( napisy_t[ zti ] );


                Napisy_Podgl¹d_Memo.Lines.Add(   Trim(  FormatFloat( '### ### ### ### ##0', czas_od )  ) + ' > ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_do )  ) + ' ' + zts_1   );


                czy_byla_liczba := true;
                czas_od := -1;
                czas_do := -1;

              end;
              //---//if not czy_dodac_napis then

            end;
          //---//if    ( czas_od = -1 ) (...)

        end;
      //---//if not czy_byla_liczba then


      Napisy_Podgl¹d_Memo.Lines.Add( zts );

    end;
  //---//for i := zti to zt_string_list_l.Count - 1 do


  FreeAndNil( zt_string_list_l );

  Wymiar_Label.Visible := false;

  Napisy_Podgl¹d_Memo.Lines.Add(    t³umaczenie_komunikaty_r.razem_napisów + ': ' + Trim(   FormatFloat(  '### ### ### ### ##0', Length( napisy_t ) - 1  )   ) + '.'    );

  Screen.Cursor := crDefault;

end;//---//Funkcja Napisy__Wczytaj().

procedure TKaraoke_Mpv_Form.Napisy__Zwolnij();
var
  i : integer;
begin

  Screen.Cursor := crHourGlass;


  for i := 0 to Length( napisy_t ) - 1 do
    FreeAndNil( napisy_t[ i ] );

  SetLength( napisy_t, 0 );


  Screen.Cursor := crDefault;

end;//---//Funkcja Napisy__Zwolnij().

procedure TKaraoke_Mpv_Form.Opcje_Panel_Ustaw( const ukryj_f : boolean = false );
begin

  if not ukryj_f then
    begin

      if PageControl1.Width <> panel_boczny_szerokoœæ_c then
        PageControl1.Width := panel_boczny_szerokoœæ_c
      else//if PageControl1.Width <> panel_boczny_szerokoœæ_c then
        PageControl1.Width := 1; // 1. Gdy równe 0 to po schowaniu nie da siê rozwin¹æ poprzez Splitter.

      if not Opcje_Splitter.Visible then
        Opcje_Splitter.Visible := true;

    end
  else//if not ukryj_f then
    begin

      if PageControl1.Width <> panel_boczny_szerokoœæ_c then
        PageControl1.Width := panel_boczny_szerokoœæ_c
      else//if PageControl1.Width <> panel_boczny_szerokoœæ_c then
        PageControl1.Width := 0; // 1. Gdy równe 0 to po schowaniu nie da siê rozwin¹æ poprzez Splitter.

      Opcje_Splitter.Visible := PageControl1.Width > 0;

    end;
  //---//if not ukryj_f then


  Opcje_Splitter.Align := alLeft;
  Opcje_Splitter.Align := alRight;

end;//---//Funkcja Opcje_Panel_Ustaw().

procedure TKaraoke_Mpv_Form.Pauza();
begin

  if mpv_base_player_g = nil then
    Exit;


  if mpv_base_player_g.GetState() = MPVBasePlayer.mpsPlay then
    Pauza_ButtonClick( nil )
  else
  if mpv_base_player_g.GetState() = MPVBasePlayer.mpsPause then
    Odtwarzaj_ButtonClick( nil );

end;//---//Funkcja Pauza().

procedure TKaraoke_Mpv_Form.Pe³ny_Ekran( const wy³¹cz_pe³ny_ekran_f : boolean = false );
begin

  if    ( Self.BorderStyle <> bsNone )
    and ( not wy³¹cz_pe³ny_ekran_f ) then
    begin

      // Pe³ny ekran.

      // Po ustawieniu pe³nego ekranu mog¹ znikaæ elementy po³o¿one na formie (jak panel), które nie s¹ wyrównywane do boków okna.

      Informacja_Tekst_Wyœwietl( 'Pe³ny ekran' );


      Self.BorderStyle := bsNone;

      if Self.WindowState = wsMaximized then
        Self.WindowState := wsNormal; // Zmaksymalizowane okno czasami nie zas³ania paska start.

      Self.WindowState := wsMaximized;

    end
  else//if    ( Self.BorderStyle <> bsNone ) (...)
    begin

      // Normalny ekran.

      Informacja_Tekst_Wyœwietl( 'Normalny ekran' );


      Self.BorderStyle := bsSizeable;
      Self.WindowState := wsNormal;

    end;
  //---//if    ( Self.BorderStyle <> bsNone ) (...)

end;//---//Funkcja Pe³ny_Ekran().

procedure TKaraoke_Mpv_Form.Plik__Multimedialny__Otwórz( const adres_pliku_f : string; const napisy_szukaj_f : boolean = true );
begin

  Informacja_Tekst_Wyœwietl( 'Otwórz plik' );


  if not FileExists( adres_pliku_f ) then
    begin

      Application.MessageBox( PChar(t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_ + #13 + #13 + adres_pliku_f), PChar(t³umaczenie_komunikaty_r.b³¹d), MB_OK + MB_ICONEXCLAMATION );
      Exit;

    end;
  //---//if not FileExists( adres_pliku_f ) then


  plik_adres__multimedialny_g := adres_pliku_f;

  Czas_ProgressBar.Position := 0;
  Czas_ProgressBar.Max := 0;


  if mpv_base_player_g = nil then
    Exit;


  mpv_base_player_g.OpenFile( adres_pliku_f );

  mpv_base_player_g.SetSubTitle( mpv__opcja__brak_napisów_c ); // Wy³¹czy standardowe wyœwietlanie napisów w odtwarzaczu.


  Czas__Aktualny_Ustaw();


  if napisy_szukaj_f then
    Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz( adres_pliku_f );

end;//---//Funkcja Plik__Multimedialny__Otwórz().

function TKaraoke_Mpv_Form.Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz( const adres_pliku_f : string ) : boolean;
var
  search_rec : TSearchRec;
  zts : string;
begin

  //
  // Funkcja znajdzie plik z rozszerzeniem nie exe i nie napisowym i wywo³a funkcjê otworzenia tego pliku.
  //

  Result := false;


  if Trim( adres_pliku_f ) = '' then
    Exit;


  zts := AnsiLowerCase(  ExtractFileExt( adres_pliku_f )  );

  if Pos( '.exe', zts ) > 0 then
    Exit;

  if   (  Pos( '.esama_karaoke', zts ) > 0  )
    or (  Pos( '.srt', zts ) > 0  )
    or (  Pos( '.txt', zts ) > 0  ) then
    begin

      if FindFirst(  ExtractFilePath( adres_pliku_f ) + '*.*', faAnyFile, search_rec  ) = 0 then // Application potrzebuje w uses Forms.
        begin

          repeat

            if    ( search_rec.Attr <> faDirectory )
              and ( search_rec.Name <> '.' )
              and ( search_rec.Name <> '..' )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> zts   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.esama_karaoke'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.srt'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.txt'   )
              and (   AnsiLowerCase(  System.IOUtils.TPath.GetFileNameWithoutExtension( search_rec.Name )  ) = AnsiLowerCase(  System.IOUtils.TPath.GetFileNameWithoutExtension( adres_pliku_f )  )   ) then
              begin

                Result := true;


                zts := ExtractFilePath( adres_pliku_f ) + search_rec.Name;

                Plik__Multimedialny__Otwórz( zts, false );

                Break;

              end;

          until FindNext( search_rec ) <> 0 // Zwraca dane kolejnego pliku zgodnego z parametrami wczeœniej wywo³anej funkcji FindFirst. Je¿eli mo¿na przejœæ do nastêpnego znalezionego pliku zwraca 0.

        end;
      //---//if FindFirst(  ExtractFilePath( adres_pliku_f ), faAnyFile, search_rec  ) = 0 then

      System.SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

    end;
  //---//if   (  Pos( '.esama_karaoke', zts ) > 0  ) (...)

end;//---//Funkcja Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz().

procedure TKaraoke_Mpv_Form.Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz( adres_pliku_f : string );

  //Funkcja Napisy__Wczytaj__Spróbuj_L() w Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz().
  function Napisy__Wczytaj__Spróbuj_L( const adres_pliku_f_f : string ) : boolean;
  begin

    if FileExists( adres_pliku_f_f ) then
      begin

        Napisy__Wczytaj( adres_pliku_f_f );

        Result := true;

      end
    else//if FileExists( adres_pliku_f_f ) then
      Result := false;

  end;//---//Funkcja Napisy__Wczytaj__Spróbuj_L() w Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz().

var
  zts : string;
begin//Funkcja Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz().

  zts := ExtractFileExt( adres_pliku_f );

  zts := System.StrUtils.ReverseString( zts );
  adres_pliku_f := System.StrUtils.ReverseString( adres_pliku_f );
  adres_pliku_f := StringReplace( adres_pliku_f, zts, '', [] );
  adres_pliku_f := System.StrUtils.ReverseString( adres_pliku_f );


  if not Napisy__Wczytaj__Spróbuj_L( adres_pliku_f + '.esama_karaoke' ) then
  if not Napisy__Wczytaj__Spróbuj_L( adres_pliku_f + '.srt' ) then
    Napisy__Wczytaj__Spróbuj_L( adres_pliku_f + '.txt' );

end;//---//Funkcja Plik__Napisów__Pasuj¹cy_Do__Multimedialnego__Otwórz().

function TKaraoke_Mpv_Form.Sekundy_W_Czas_Trwania( czas_sekundy_f : double ) : string;

  //Funkcja Milisekundy_Na_4_Znakach() w Sekundy_W_Czas_Trwania().
  function Milisekundy_Na_4_Znakach( milisekundy_s_f : string ) : string;
  var
    zti : integer;
  begin

    if milisekundy_s_f = '0' then
      milisekundy_s_f := '0.0';

    milisekundy_s_f := StringReplace( milisekundy_s_f, ',', '.', [ rfReplaceAll ] ); // 0,123


    Result := milisekundy_s_f;

    zti := Pos( '.', milisekundy_s_f );

    if zti <= 0 then
      Exit;


    Delete( milisekundy_s_f, 1, zti );


    while Length( milisekundy_s_f ) < 4 do
      milisekundy_s_f := milisekundy_s_f + '0';


    if Length( milisekundy_s_f ) > 4 then
      Delete(  milisekundy_s_f, 5, Length( milisekundy_s_f )  );


    Result := milisekundy_s_f;

  end;//---//Funkcja Milisekundy_Na_4_Znakach() w Sekundy_W_Czas_Trwania().

var
  dni_l,
  godziny_l,
  minuty_l
    : integer;

  milisekundy_s_l : string;
begin//Funkcja Sekundy_W_Czas_Trwania().

  milisekundy_s_l := Milisekundy_Na_4_Znakach(   FloatToStr(  Frac( czas_sekundy_f )  )   );
  czas_sekundy_f := System.Math.Floor( czas_sekundy_f );

  dni_l := Trunc( czas_sekundy_f / 86400 ); // 86400 = 60 * 60 * 24.
  czas_sekundy_f := czas_sekundy_f - dni_l * 86400;

  godziny_l := Trunc( czas_sekundy_f / 3600 ); // 3600 = 60 * 60.
  czas_sekundy_f := czas_sekundy_f - godziny_l * 3600;

  minuty_l := Trunc( czas_sekundy_f / 60 ); // 60 = 60.
  czas_sekundy_f := czas_sekundy_f - minuty_l * 60;


  Result := FormatFloat( '00', minuty_l ) + ':' + FormatFloat( '00', czas_sekundy_f ) + '.' + milisekundy_s_l;

  if godziny_l > 0 then
    Result :=
      IntToStr( godziny_l ) + ':' +
      Result;

  if dni_l > 0 then
    Result :=
      Trim(  FormatFloat( '### ### ##0', dni_l )  ) + ' ' +
      Result;

end;//---//Funkcja Sekundy_W_Czas_Trwania().

procedure TKaraoke_Mpv_Form.Skok_Do__Przodu( const sekundy_f : double = 3 );
var
  ztdo : double;

  zts : string;
begin

  if sekundy_f >= 0 then
    zts := '+ '
  else
    zts := '- ';


  Informacja_Tekst_Wyœwietl(   zts + FloatToStr(  Abs( sekundy_f )  ) + ' [s]'   );


  if   ( mpv_base_player_g = nil )
    or (  not ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )  ) then
    Exit;



  ztdo := mpv_base_player_g.CurrentSeconds + sekundy_f;

  if ztdo < 0 then
    ztdo := 0
  else
  if ztdo > mpv_base_player_g.TotalSeconds - 1 then
    ztdo := mpv_base_player_g.TotalSeconds - 1;


  mpv_base_player_g.Seek( ztdo, false );

end;//---//Funkcja Skok_Do__Przodu().

procedure TKaraoke_Mpv_Form.Skok_Do__Ty³u( const sekundy_f : double = 3 );
begin

  Skok_Do__Przodu( -sekundy_f );

end;//---//Funkcja Skok_Do__Ty³u().

procedure TKaraoke_Mpv_Form.T³umaczenia__Domyœlne();
begin

  t³umaczenie_komunikaty_r.b³¹d := 'B³¹d';
  t³umaczenie_komunikaty_r.domyœlne := 'domyœlne';
  t³umaczenie_komunikaty_r.eryzyjskie := 'Eryzyjskie';
  t³umaczenie_komunikaty_r.multimedia := 'Multimedia';
  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_ := 'Nie odnaleziono pliku.';
  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_napisów_ := 'Nie odnaleziono pliku napisów.';
  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_t³umaczenia_ := 'Nie odnaleziono pliku t³umaczenia.';
  t³umaczenie_komunikaty_r.nie_uda³o_siê_wczytaæ__MPV_dll__ := 'Nie uda³o siê wczytaæ ''MPV dll''.';
  t³umaczenie_komunikaty_r.podgl¹d_napisów := 'Podgl¹d napisów';
  t³umaczenie_komunikaty_r.pomoc :=
    'Enter, F - pe³ny ekran' + #13 + #10 +
    'Esc - normalny ekran' + #13 + #10 +
    'F11 - opcje zwiñ / rozwiñ' + #13 + #10 +
    'F12 - opcje wyœwietl / ukryj' + #13 + #10 +
    'L - widocznoœæ linii œpiewu' + #13 + #10 +
    'M - wycisz' + #13 + #10 +
    'N - prze³aduj napisy' + #13 + #10 +
    'N + Ctrl - otwórz napisy' + #13 + #10 +
    'N + Ctrl + Shift, X - wyczyœæ napisy' + #13 + #10 +
    'O - odtwarzaj' + #13 + #10 +
    'O + Ctrl - otwórz plik' + #13 + #10 +
    'P - pauza' + #13 + #10 +
    'S - stop' + #13 + #10 +
    'Spacja - pauza / wznów' + #13 + #10 +
    'Strza³ka w dó³, - (klawiatura numeryczna) - zmniejsz g³oœnoœæ' + #13 + #10 +
    'Strza³ka w górê, + (klawiatura numeryczna) - zwiêksz g³oœnoœæ' + #13 + #10 +
    'Strza³ka w lewo - ma³y skok do ty³u' + #13 + #10 +
    'Strza³ka w lewo + Ctrl - œredni skok do ty³u' + #13 + #10 +
    'Strza³ka w lewo + Shift - du¿y skok do ty³u' + #13 + #10 +
    'Strza³ka w lewo + Ctrl + Shift - minimalny skok do ty³u' + #13 + #10 +
    'Strza³ka w prawo - ma³y skok do przodu' + #13 + #10 +
    'Strza³ka w prawo + Ctrl - œredni skok do przodu' + #13 + #10 +
    'Strza³ka w prawo + Shift - du¿y skok do przodu' + #13 + #10 +
    'Strza³ka w prawo + Ctrl + Shift - minimalny skok do przodu' + #13 + #10 +
    '? - pomoc' + #13 + #10 +
    '[ - przesuniêcie napisów przyœpiesz 100 ms' + #13 + #10 +
    '[ + Ctrl - przesuniêcie napisów przyœpiesz 500 ms' + #13 + #10 +
    '] - przesuniêcie napisów opóŸnij 100 ms' + #13 + #10 +
    '] + Ctrl - przesuniêcie napisów opóŸnij 500 ms' + #13 + #10 +
    ''' - przesuniêcie napisów wyzeruj' + #13 + #10 +
    'LPM (na ekranie) trzymaj i poruszaj góra dó³ - dostosuj g³oœnoœæ' + #13 + #10 +
    'LPM (na ekranie) trzymaj i poruszaj lewo prawo - przewiñ czas';
  t³umaczenie_komunikaty_r.razem_napisów := 'Razem napisów';
  t³umaczenie_komunikaty_r.tekstowe := 'Tekstowe';
  t³umaczenie_komunikaty_r.wszystkie := 'Wszystkie';


  Czas__Bie¿¹cy_Label.Hint := '';
  Czas__Ca³kowity_Label.Hint := '';
  G³oœnoœæ_Label.Hint := 'G³oœnoœæ.';
  G³oœnoœæ_ProgressBar.Hint := 'Poziom g³oœnoœci.' + #13 + #10 + #13 + #10 + '[M - wycisz]' + #13 + #10 + '[Strza³ka w dó³, - - zmniejsz g³oœnoœæ]' + #13 + #10 + '[Strza³ka w górê, + - zwiêksz g³oœnoœæ]';
  Jedno_Uruchomienie_Programu_CheckBox.Caption := 'Jedno urucho.';
  Jedno_Uruchomienie_Programu_CheckBox.Hint := 'Jedno uruchomienie programu.';
  Linie_Œpiewu_GroupBox.Caption := 'Linie œpiewu';
  Linie_Œpiewu_GroupBox.Hint := '';
  Linie_Œpiewu__Kolor_Button.Caption := 'Kolor';
  Linie_Œpiewu__Kolor_Button.Hint := '';
  Linie_Œpiewu__Odstêp_Etykieta_Label.Caption := 'Odstêp';
  Linie_Œpiewu__Odstêp_Etykieta_Label.Hint := '';
  Linie_Œpiewu__Odstêp_SpinEdit.Hint := '';
  Linie_Œpiewu__Pozycja_Etykieta_Label.Caption := 'Pozycja [%]';
  Linie_Œpiewu__Pozycja_Etykieta_Label.Hint := '';
  Linie_Œpiewu__Pozycja_SpinEdit.Hint := '';
  Linie_Œpiewu__Widocznoœæ_CheckBox.Caption := '';
  Linie_Œpiewu__Widocznoœæ_CheckBox.Hint := 'Widocznoœæ linii œpiewu.' + #13 + #10 + #13 + #10 + '[L]';
  Linie_Œpiewu__Wielkoœæ_Etykieta_Label.Caption := 'Wielkoœæ';
  Linie_Œpiewu__Wielkoœæ_Etykieta_Label.Hint := '';
  Linie_Œpiewu__Wielkoœæ_SpinEdit.Hint := '';
  Napisy_GroupBox.Caption := 'Napisy';
  Napisy_GroupBox.Hint := '';
  Napisy__Czcionka_Button.Caption := 'Czcionka';
  Napisy__Czcionka_Button.Hint := '';
  Napisy__T³o_Button.Caption := 'T³o';
  Napisy__T³o_Button.Hint := '';
  Napisy_Podgl¹d_TabSheet.Caption := 'Napisy';
  O_Programie_TabSheet.Caption := 'O programie';
  Odtwarzaj_Button.Caption := '>';
  Odtwarzaj_Button.Hint := 'Odtwarzaj.' + #13 + #10 + #13 + #10 + '[O]' + #13 + #10 + '[Spacja - prze³¹cz]';
  Opcje_TabSheet.Caption := 'Opcje';
  Pauza_Button.Caption := '||';
  Pauza_Button.Hint := 'Pauza / wznów.' + #13 + #10 + #13 + #10 + '[P]' + #13 + #10 + '[Spacja - prze³¹cz]';
  Plik__Multimedialny__Otwórz_Button.Caption := 'P';
  Plik__Multimedialny__Otwórz_Button.Hint := 'Otwórz plik multimedialny.' + #13 + #10 + #13 + #10 + '[Ctrl + O]';
  Plik__Napisy__Otwórz_Button.Caption := 'N';
  Plik__Napisy__Otwórz_Button.Hint := 'Otwórz napisy.' + #13 + #10 + #13 + #10 + '[Ctrl + N]';
  Pomoc_BitBtn.Caption := '';
  Pomoc_BitBtn.Hint := 'Pomoc.' + #13 + #10 + #13 + #10 + '[?]';
  Pomoc_Memo.Hint := '';
  Pomoc_TabSheet.Caption := 'Pomoc';
  Program_Do_Dzia³ania_Potrzebuje___T³umaczenie_Label.Caption := '';
  Przesuniêcie_Napisów_Etykieta_Label.Caption := 'Przesuniêcie napisów [ms]';
  Przesuniêcie_Napisów_Etykieta_Label.Hint := 'Przesuniêcie napisów.' + #13 + #10 + #13 + #10 + '[[ - przyœpiesz 100 ms]' + #13 + #10 + '[] - opóŸnij 100 ms]' + #13 + #10 + '[Ctrl + [ - przyœpiesz 500 ms]' + #13 + #10 + '[Ctrl + ] - opóŸnij 500 ms]' + #13 + #10 + '['' - wyzeruj]';
  Przesuniêcie_Napisów_SpinEdit.Hint := '';
  Skok_Do__Przodu_Button.Caption := '>>';
  Skok_Do__Przodu_Button.Hint := 'Skok do przodu.' + #13 + #10 + #13 + #10 + '[Strza³ka w prawo - ma³y skok]' + #13 + #10 + '[Strza³ka w prawo + Ctrl - œredni skok]' + #13 + #10 + '[Strza³ka w prawo + Shift - du¿y skok]' + #13 + #10 + '[Strza³ka w prawo + Ctrl + Shift - minimalny skok]';
  Skok_Do__Ty³u_Button.Caption := '<<';
  Skok_Do__Ty³u_Button.Hint := 'Skok do ty³u.' + #13 + #10 + #13 + #10 + '[Strza³ka w lewo - ma³y skok]' + #13 + #10 + '[Strza³ka w lewo + Ctrl - œredni skok]' + #13 + #10 + '[Strza³ka w lewo + Shift - du¿y skok]' + #13 + #10 + '[Strza³ka w lewo + Ctrl + Shift - minimalny skok]';
  Sterowanie_TabSheet.Caption := 'Sterowanie';
  Stop_Button.Caption := '[_]';
  Stop_Button.Hint := 'Stop.' + #13 + #10 + #13 + #10 + '[S]';
  T³umaczenie_Etykieta_Label.Caption := 'T³umaczenie';
  T³umaczenie_Etykieta_Label.Hint := '[Enter] - zastosuj' + #13 + #10 + '[Ctrl + R] - wczytaj';
  T³umaczenie_ComboBox.Hint := '';
  Ustawienia_GroupBox.Caption := 'Ustawienia';
  Ustawienia_GroupBox.Hint := '';
  Ustawienia__Domyœlne_Button.Caption := 'Domyœlne';
  Ustawienia__Domyœlne_Button.Hint := '';
  Ustawienia__Wczytaj_Button.Caption := 'Wczytaj';
  Ustawienia__Wczytaj_Button.Hint := '';
  Ustawienia__Zapisz_Button.Caption := 'Zapisz';
  Ustawienia__Zapisz_Button.Hint := '';
  W_Projekcie_Wykorzystano_Label.Caption := 'W projekcie wykorzystano:';


  T³umaczenia__Zastosuj__Dodatkowe();

end;//---//Funkcja T³umaczenia__Domyœlne().

procedure TKaraoke_Mpv_Form.T³umaczenia__Lista__Wczytaj();
var
  i : integer;

  zts,
  t³umaczenie_nazwa_kopia_l
    : string;

  search_rec : TSearchRec;
begin

  t³umaczenie_nazwa_kopia_l := T³umaczenie_ComboBox.Text;
  T³umaczenie_ComboBox.Items.Clear();
  T³umaczenie_ComboBox.Items.Add( t³umaczenie__wyró¿nik__domyœlne_c + t³umaczenie_komunikaty_r.domyœlne + '>' );
  T³umaczenie_ComboBox.ItemIndex := 0;

  if FindFirst(  ExtractFilePath( Application.ExeName ) + t³umaczenia__katalog__nazwa_c + System.IOUtils.TPath.DirectorySeparatorChar + '*.txt', faAnyFile, search_rec  ) = 0 then
    begin

      repeat

        // Dodaje nazwy plików bez rozszerzeñ.

        zts := search_rec.Name;
        zts := System.StrUtils.ReverseString( zts );
        Delete(  zts, 1, Pos( '.', zts )  );
        zts := System.StrUtils.ReverseString( zts );

        T³umaczenie_ComboBox.Items.Add( zts );

      until FindNext( search_rec ) <> 0

    end;

  FindClose( search_rec );

  if Trim( t³umaczenie_nazwa_kopia_l ) <> '' then
    for i := T³umaczenie_ComboBox.Items.Count - 1 downto 0 do
      if   ( T³umaczenie_ComboBox.Items[ i ] = t³umaczenie_nazwa_kopia_l )
        or (
                 (  Pos( t³umaczenie__wyró¿nik__domyœlne_c, t³umaczenie_nazwa_kopia_l ) > 0  )
             and (  Pos( t³umaczenie__wyró¿nik__domyœlne_c, T³umaczenie_ComboBox.Items[ i ] ) > 0  )
           ) then
        begin

          T³umaczenie_ComboBox.ItemIndex := i;
          Break;

        end;

end;//---//T³umaczenia__Lista__Wczytaj().

procedure TKaraoke_Mpv_Form.T³umaczenia__Zastosuj();
const
  t³umaczenie_komunikaty_r_c_l : string = 't³umaczenie_komunikaty_r.';
  t³umaczenie__nowa_linia_c_l : string = '#13#10';
  t³umaczenie__wyró¿nik__elementy_c_l : string = '-->Elementy';
  t³umaczenie__wyró¿nik__podpowiedz_c_l : string = '-->PodpowiedŸ';

var
  czy_elementy, // Czy t³umaczenie dotyczy elementów komponentu (np. pozycje listy rozwijanej).
  czy_podpowiedz // Czy t³umaczenie dotyczy podpowiedzi komponentu.
    : boolean;

  i,
  zti_1
    : integer;

  zts_1,
  zts_2,
  nazwa
    : string;

  rtti_field : System.Rtti.TRttiField; // Wariant z RTTI.

  rtti_type : System.Rtti.TRttiType;

  zt_string_list_l : TStringList;
  zt_component : TComponent;
begin

  T³umaczenia__Domyœlne();


  zts_2 := T³umaczenie_ComboBox.Text;

  if Pos( t³umaczenie__wyró¿nik__domyœlne_c, zts_2 ) > 0 then
    begin

      Exit;

    end
  else//if Pos( t³umaczenie__wyró¿nik__domyœlne_c, zts_2 ) > 0 then
    zts_2 := t³umaczenia__katalog__nazwa_c + System.IOUtils.TPath.DirectorySeparatorChar + zts_2 + '.txt';

  zts_1 := ExtractFilePath( Application.ExeName ) + zts_2;


  if not FileExists( zts_1 ) then // Sprawdza czy istnieje plik.
    begin

      Application.MessageBox( PChar(t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_t³umaczenia_ + #13 + #13 + zts_1), PChar(t³umaczenie_komunikaty_r.b³¹d), MB_OK + MB_ICONEXCLAMATION );
      Exit;

    end;
  //---//if not FileExists( zts_1 ) then


  Screen.Cursor := crHourGlass;


  zt_string_list_l := TStringList.Create();
  zt_string_list_l.LoadFromFile( zts_1, TEncoding.UTF8 ); // Je¿eli pliku nie ma to nie trzeba wczytywaæ, mo¿na od razu dodawaæ linie.


  if zt_string_list_l.Count > 0 then // Wariant z RTTI.
    rtti_type := System.Rtti.TRTTIContext.Create.GetType(  System.TypeInfo( TT³umaczenie_Komunikaty_r )  );


  for i := 0 to zt_string_list_l.Count - 1 do
    begin

      zts_1 := zt_string_list_l[ i ];

      if Trim( zts_1 ) <> '' then
        begin

          zti_1 := Pos( '=', zts_1 );

          // Te pozycje nie podlegaj¹ t³umaczeniu.
          if   (
                     (  Pos( Czas__Bie¿¹cy_Label.Name, zts_1 ) > 0  )
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (
                     (  Pos( Czas__Ca³kowity_Label.Name, zts_1 ) > 0  )
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (  Pos( E_Mail_LinkLabel.Name, zts_1 ) > 0  )
            or (
                     (  Pos( G³oœnoœæ_Label.Name, zts_1 ) > 0  )
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (  Pos( LibMPVDelphi_LinkLabel.Name, zts_1 ) > 0  )
            or (  Pos( Mpv_LinkLabel.Name, zts_1 ) > 0  )
            or (  Pos( Mpv_Player_Windows_Files_LinkLabel.Name, zts_1 ) > 0  )
            or (  Pos( Napisy_Podgl¹d_Memo.Name, zts_1 ) > 0  )
            or (  Pos( O_Programie_1_Label.Name, zts_1 ) > 0  )
            or (  Pos( O_Programie_2_Label.Name, zts_1 ) > 0  )
            or (
                     (  Pos( Pomoc_Memo.Name, zts_1 ) > 0  )
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (
                     (  Pos( T³umaczenie_ComboBox.Name, zts_1 ) > 0  )
                 and (  Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (  Pos( Program_Do_Dzia³ania_Potrzebuje_Label.Name, zts_1 ) > 0  )
            or (  Pos( Www_LinkLabel.Name, zts_1 ) > 0  ) then
            zti_1 := -1;

          // Komentarze '//(...)', '    //(...)'.
          zts_2 := Trim( zts_1 );

          if    ( Length( zts_2 ) > 1 )
            and ( zts_2[ 1 ] = '*' )
            and ( zts_2[ 2 ] = '*' ) then
            zti_1 := -1;

          if zti_1 > 1 then
            begin

              if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komponenty.'}
                  if Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_podpowiedz := true;
                      zts_1 := StringReplace( zts_1, t³umaczenie__wyró¿nik__podpowiedz_c_l , '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( t³umaczenie__wyró¿nik__podpowiedz_c_l + '=', zts_1 ) > 0 then
                    czy_podpowiedz := false;

                  if Pos( t³umaczenie__wyró¿nik__elementy_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_elementy := true;
                      zts_1 := StringReplace( zts_1, t³umaczenie__wyró¿nik__elementy_c_l, '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( t³umaczenie__wyró¿nik__elementy_c_l + '=', zts_1 ) > 0 then
                    czy_elementy := false;


                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zts_2 := nazwa;


                  zt_component := nil;

                  zt_component := Self.FindComponent( zts_2 );


                  //if czy_podpowiedz then
                  //  begin
                  //
                  //    // Te podpowiedzi pozycji menu nie podlegaj¹ t³umaczeniu.
                  //    if   (  Pos( 'abc', nazwa ) > 0  )
                  //      or (  Pos( 'def', nazwa ) > 0  ) then
                  //      zt_component := nil;
                  //
                  //  end;
                  ////---//if czy_podpowiedz then


                  if zt_component <> nil then
                    begin

                      zts_1 := StringReplace( zts_1, t³umaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                      if Pos( '_BitBtn', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TBitBtn(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TBitBtn(zt_component).Hint := zts_1;

                          if    (  Trim( TBitBtn(zt_component).Hint ) <> ''  )
                            and ( not TBitBtn(zt_component).ShowHint ) then
                            TBitBtn(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_Button', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TButton(zt_component).Hint := zts_1;

                          if    (  Trim( TButton(zt_component).Hint ) <> ''  )
                            and ( not TButton(zt_component).ShowHint ) then
                            TButton(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_CheckBox', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TCheckBox(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TCheckBox(zt_component).Hint := zts_1;

                          if    (  Trim( TCheckBox(zt_component).Hint ) <> ''  )
                            and ( not TCheckBox(zt_component).ShowHint ) then
                            TCheckBox(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_ComboBox', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TComboBox(zt_component).Hint := zts_1;

                          if    (  Trim( TComboBox(zt_component).Hint ) <> ''  )
                            and ( not TComboBox(zt_component).ShowHint ) then
                            TComboBox(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_GroupBox', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TGroupBox(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TGroupBox(zt_component).Hint := zts_1;

                          if    (  Trim( TGroupBox(zt_component).Hint ) <> ''  )
                            and ( not TGroupBox(zt_component).ShowHint ) then
                            TGroupBox(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_Label', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TLabel(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TLabel(zt_component).Hint := zts_1;

                          if    (  Trim( TLabel(zt_component).Hint ) <> ''  )
                            and ( not TLabel(zt_component).ShowHint ) then
                            TLabel(zt_component).ShowHint := true;

                        end
                      else
                      //if Pos( '_Panel', nazwa ) > 0 then
                      //  begin
                      //
                      //    if not czy_podpowiedz then
                      //      TPanel(zt_component).Caption := zts_1
                      //    else//if not czy_podpowiedz then
                      //      TPanel(zt_component).Hint := zts_1;
                      //
                      //    if    (  Trim( TPanel(zt_component).Hint ) <> ''  )
                      //      and ( not TPanel(zt_component).ShowHint ) then
                      //      TPanel(zt_component).ShowHint := true;
                      //
                      //  end
                      //else
                      if Pos( '_ProgressBar', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TProgressBar(zt_component).Hint := zts_1;

                          if    (  Trim( TProgressBar(zt_component).Hint ) <> ''  )
                            and ( not TProgressBar(zt_component).ShowHint ) then
                            TProgressBar(zt_component).ShowHint := true;

                        end
                      else
                      //if Pos( '_ScrollBox', nazwa ) > 0 then
                      //  begin
                      //
                      //    if czy_podpowiedz then
                      //      TScrollBox(zt_component).Hint := zts_1;
                      //
                      //    if    (  Trim( TScrollBox(zt_component).Hint ) <> ''  )
                      //      and ( not TScrollBox(zt_component).ShowHint ) then
                      //      TScrollBox(zt_component).ShowHint := true;
                      //
                      //  end
                      //else
                      if Pos( '_SpinEdit', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TSpinEdit(zt_component).Hint := zts_1;

                          if    (  Trim( TSpinEdit(zt_component).Hint ) <> ''  )
                            and ( not TSpinEdit(zt_component).ShowHint ) then
                            TSpinEdit(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_TabSheet', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TTabSheet(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TTabSheet(zt_component).Hint := zts_1;

                          if    (  Trim( TTabSheet(zt_component).Hint ) <> ''  )
                            and ( not TTabSheet(zt_component).ShowHint ) then
                            TTabSheet(zt_component).ShowHint := true;

                        end
                      else
                        ;

                    end;
                  //---//if zt_component <> nil then
                  {$endregion 'Komponenty.'}

                end
              else//if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komunikaty.'}
                  nazwa := Copy( zts_1, 1, zti_1 - 1 ); // Tutaj jest nazwa komunikatu.
                  Delete( zts_1, 1, zti_1 );

                  zts_1 := StringReplace( zts_1, t³umaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                  // Wariant bez RTTI.
                  // Wszystkie pola rekordu nale¿y rozpisaæ w ten sposób.
                  //if nazwa = 't³umaczenie_komunikaty_r.b³¹d' then
                  //  t³umaczenie_komunikaty_r.b³¹d := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.domyœlne' then
                  //  t³umaczenie_komunikaty_r.domyœlne := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.eryzyjskie' then
                  //  t³umaczenie_komunikaty_r.eryzyjskie := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.multimedia' then
                  //  t³umaczenie_komunikaty_r.multimedia := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.nie_odnaleziono_pliku_' then
                  //  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_ := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.nie_odnaleziono_pliku_napisów_' then
                  //  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_napisów_ := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.nie_odnaleziono_pliku_t³umaczenia_' then
                  //  t³umaczenie_komunikaty_r.nie_odnaleziono_pliku_t³umaczenia_ := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.nie_uda³o_siê_wczytaæ__MPV_dll__' then
                  //  t³umaczenie_komunikaty_r.nie_uda³o_siê_wczytaæ__MPV_dll__ := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.podgl¹d_napisów' then
                  //  t³umaczenie_komunikaty_r.podgl¹d_napisów := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.pomoc' then
                  //  t³umaczenie_komunikaty_r.pomoc := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.razem_napisów' then
                  //  t³umaczenie_komunikaty_r.razem_napisów := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.tekstowe' then
                  //  t³umaczenie_komunikaty_r.tekstowe := zts_1
                  //else
                  //if nazwa = 't³umaczenie_komunikaty_r.wszystkie' then
                  //  t³umaczenie_komunikaty_r.wszystkie := zts_1;
                  //---// Wariant bez RTTI.

                  // Wariant z RTTI.
                  nazwa := StringReplace( nazwa, t³umaczenie_komunikaty_r_c_l, '', [ rfReplaceAll ] );

                  for rtti_field in rtti_type.GetFields do
                    if rtti_field.Name = nazwa then
                      begin

                        if rtti_field.GetValue( @t³umaczenie_komunikaty_r ).Kind in [ System.TypInfo.tkString, System.TypInfo.tkLString, System.TypInfo.tkUString, System.TypInfo.tkWString ] then
                          rtti_field.SetValue( @t³umaczenie_komunikaty_r, zts_1 );

                        Break;

                      end;
                  //---// Wariant z RTTI.
                  {$endregion 'Komunikaty.'}

                end;
              //---//if Pos( t³umaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then

            end;
          //---//if zti_1 > 1 then

        end;
      //---//if Trim( zts_1 ) <> '' then

    end;
  //---//for i := 0 to zt_string_list_l.Count - 1 do

  FreeAndNil( zt_string_list_l);


  T³umaczenia__Zastosuj__Dodatkowe();


  Screen.Cursor := crDefault;

end;//---//Funkcja T³umaczenia__Zastosuj().

procedure TKaraoke_Mpv_Form.T³umaczenia__Zastosuj__Dodatkowe();
begin

  pliki__multimedialne_rozszerzenia__t³umaczenie_g := pliki__multimedialne_rozszerzenia_g;
  pliki__napisów_rozszerzenia__t³umaczenie_g := pliki__napisów_rozszerzenia_g;

  pliki__multimedialne_rozszerzenia__t³umaczenie_g := StringReplace( pliki__multimedialne_rozszerzenia__t³umaczenie_g, t³umaczenie__s³owo__multimedia_c, t³umaczenie_komunikaty_r.multimedia, [ rfReplaceAll ] );
  pliki__multimedialne_rozszerzenia__t³umaczenie_g := StringReplace( pliki__multimedialne_rozszerzenia__t³umaczenie_g, t³umaczenie__s³owo__wszystkie_c, t³umaczenie_komunikaty_r.wszystkie, [ rfReplaceAll ] );

  pliki__napisów_rozszerzenia__t³umaczenie_g := StringReplace( pliki__napisów_rozszerzenia__t³umaczenie_g, t³umaczenie__s³owo__eryzyjskie_c, t³umaczenie_komunikaty_r.eryzyjskie, [ rfReplaceAll ] );
  pliki__napisów_rozszerzenia__t³umaczenie_g := StringReplace( pliki__napisów_rozszerzenia__t³umaczenie_g, t³umaczenie__s³owo__tekstowe_c, t³umaczenie_komunikaty_r.tekstowe, [ rfReplaceAll ] );
  pliki__napisów_rozszerzenia__t³umaczenie_g := StringReplace( pliki__napisów_rozszerzenia__t³umaczenie_g, t³umaczenie__s³owo__wszystkie_c, t³umaczenie_komunikaty_r.wszystkie, [ rfReplaceAll ] );


  Pomoc_Memo.Lines.Clear();
  Pomoc_Memo.Lines.Add( Pomoc_TabSheet.Caption );
  Pomoc_Memo.Lines.Add( '' );
  Pomoc_Memo.Lines.Add( t³umaczenie_komunikaty_r.pomoc );
  Pomoc_Memo.Lines.Add( '' );
  Pomoc_Memo.Lines.Add( '' );
  Pomoc_Memo.Lines.Add( pomoc_memo_tekst_kopia_g );

end;//---//Funkcja T³umaczenia__Zastosuj().

function TKaraoke_Mpv_Form.Ustawienia__Wczytaj_Zapisz( const zapisz_f : boolean; const konfiguracja__tylko_f : boolean = false ) : double;

  procedure Font__To_Stream__Save( stream_f : TStream; zt_label_f : TLabel );
  var
    zt_log_font : TLogFont;
    zt_color : TColor;
  begin

    // https://stackoverflow.com/questions/19163832/how-to-convert-a-fontfontstyle-fontcolor-fontsize-to-a-string

    if GetObject(  zt_label_f.Font.Handle, SizeOf( zt_log_font ), @zt_log_font  ) = 0 then
      RaiseLastOSError();

    stream_f.WriteBuffer(  zt_log_font, SizeOf( zt_log_font )  );

    zt_color := zt_label_f.Font.Color;
    stream_f.WriteBuffer(  zt_color, SizeOf( zt_color )  );

    zt_color := zt_label_f.Color;
    stream_f.WriteBuffer(  zt_color, SizeOf( zt_color )  );

  end;

  procedure Font__From_Stream__Load( stream_f : TStream; zt_label_f : TLabel );
  var
    zt_log_font : TLogFont;
    zt_hfont : HFONT;
    zt_color : TColor;
  begin

    // https://stackoverflow.com/questions/19163832/how-to-convert-a-fontfontstyle-fontcolor-fontsize-to-a-string

    stream_f.ReadBuffer(  zt_log_font, SizeOf( zt_log_font )  );
    zt_hfont := CreateFontIndirect( zt_log_font );

    if zt_hfont = 0 then
      RaiseLastOSError();

    zt_label_f.Font.Handle := zt_hfont;

    stream_f.ReadBuffer(  zt_color, SizeOf( zt_color )  );
    zt_label_f.Font.Color := zt_color;

    stream_f.ReadBuffer(  zt_color, SizeOf( zt_color )  );
    zt_label_f.Color := zt_color;

  end;

var
  i : integer;

  g³oœnoœæ__poziom_l : double;

  t³umaczenie_nazwa_kopia_l : string;

  file_ini : System.IniFiles.TIniFile;

  zt_string_stream : TStringStream;
begin

  Result := -1;


  file_ini := System.IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + plik__ini_nazwa_c  );

  zt_string_stream := TStringStream.Create();


  {$region 'Ini file.'}
  if   ( zapisz_f )
    or (  not file_ini.ValueExists( 'Konfiguracja', 'g³oœnoœæ' )  ) then
    begin

      if mpv_base_player_g <> nil then
        g³oœnoœæ__poziom_l := mpv_base_player_g.GetVolume()
      else
        g³oœnoœæ__poziom_l := g³oœnoœæ__poziom__domyœlny_g;


      file_ini.WriteFloat( 'Konfiguracja', 'g³oœnoœæ', g³oœnoœæ__poziom_l );

    end
  else
    g³oœnoœæ__poziom_l := file_ini.ReadFloat( 'Konfiguracja', 'g³oœnoœæ', g³oœnoœæ__poziom_l );

  Result := g³oœnoœæ__poziom_l;



  if not konfiguracja__tylko_f then
    begin

      // Opcje.

      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'g³oœnoœæ__poziom__domyœlny' )  ) then
        file_ini.WriteFloat( 'Opcje', 'g³oœnoœæ__poziom__domyœlny', g³oœnoœæ__poziom__domyœlny_g )
      else
        g³oœnoœæ__poziom__domyœlny_g := file_ini.ReadFloat( 'Opcje', 'g³oœnoœæ__poziom__domyœlny', g³oœnoœæ__poziom__domyœlny_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'g³oœnoœæ__poziom__maksymalny' )  ) then
        file_ini.WriteFloat( 'Opcje', 'g³oœnoœæ__poziom__maksymalny', g³oœnoœæ__poziom__maksymalny_g )
      else
        g³oœnoœæ__poziom__maksymalny_g := file_ini.ReadFloat( 'Opcje', 'g³oœnoœæ__poziom__maksymalny', g³oœnoœæ__poziom__maksymalny_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'g³oœnoœæ__poziom__minimalny' )  ) then
        file_ini.WriteFloat( 'Opcje', 'g³oœnoœæ__poziom__minimalny', g³oœnoœæ__poziom__minimalny_g )
      else
        g³oœnoœæ__poziom__minimalny_g := file_ini.ReadFloat( 'Opcje', 'g³oœnoœæ__poziom__minimalny', g³oœnoœæ__poziom__minimalny_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'g³oœnoœæ__skok__du¿y' )  ) then
        file_ini.WriteFloat( 'Opcje', 'g³oœnoœæ__skok__du¿y', g³oœnoœæ__skok__du¿y_g )
      else
        g³oœnoœæ__skok__du¿y_g := file_ini.ReadFloat( 'Opcje', 'g³oœnoœæ__skok__du¿y', g³oœnoœæ__skok__du¿y_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'g³oœnoœæ__skok__ma³y' )  ) then
        file_ini.WriteFloat( 'Opcje', 'g³oœnoœæ__skok__ma³y', g³oœnoœæ__skok__ma³y_g )
      else
        g³oœnoœæ__skok__ma³y_g := file_ini.ReadFloat( 'Opcje', 'g³oœnoœæ__skok__ma³y', g³oœnoœæ__skok__ma³y_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'jedno_uruchomienie_programu' )  ) then
        file_ini.WriteBool( 'Opcje', 'jedno_uruchomienie_programu', Jedno_Uruchomienie_Programu_CheckBox.Checked )
      else
        Jedno_Uruchomienie_Programu_CheckBox.Checked := file_ini.ReadBool( 'Opcje', 'jedno_uruchomienie_programu', Jedno_Uruchomienie_Programu_CheckBox.Checked );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'linia_œpiewu__kolor' )  ) then
        file_ini.WriteInteger( 'Opcje', 'linia_œpiewu__kolor', Linia_Œpiewu__Dó³_StaticText.Color )
      else
        begin

          Linia_Œpiewu__Dó³_StaticText.Color := file_ini.ReadInteger( 'Opcje', 'linia_œpiewu__kolor', Linia_Œpiewu__Dó³_StaticText.Color );

          Linia_Œpiewu__Góra_StaticText.Color := Linia_Œpiewu__Dó³_StaticText.Color;

        end;


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'linie_œpiewu__odstêp' )  ) then
        file_ini.WriteInteger( 'Opcje', 'linie_œpiewu__odstêp', Linie_Œpiewu__Odstêp_SpinEdit.Value )
      else
        Linie_Œpiewu__Odstêp_SpinEdit.Value := file_ini.ReadInteger( 'Opcje', 'linie_œpiewu__odstêp', Linie_Œpiewu__Odstêp_SpinEdit.Value );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'linie_œpiewu__pozycja' )  ) then
        file_ini.WriteInteger( 'Opcje', 'linie_œpiewu__pozycja', Linie_Œpiewu__Pozycja_SpinEdit.Value )
      else
        Linie_Œpiewu__Pozycja_SpinEdit.Value := file_ini.ReadInteger( 'Opcje', 'linie_œpiewu__pozycja', Linie_Œpiewu__Pozycja_SpinEdit.Value );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'linie_œpiewu__wielkoœæ' )  ) then
        file_ini.WriteInteger( 'Opcje', 'linie_œpiewu__wielkoœæ', Linie_Œpiewu__Wielkoœæ_SpinEdit.Value )
      else
        Linie_Œpiewu__Wielkoœæ_SpinEdit.Value := file_ini.ReadInteger( 'Opcje', 'linie_œpiewu__wielkoœæ', Linie_Œpiewu__Wielkoœæ_SpinEdit.Value );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'linie_œpiewu__widocznoœæ' )  ) then
        file_ini.WriteBool( 'Opcje', 'linie_œpiewu__widocznoœæ', Linie_Œpiewu__Widocznoœæ_CheckBox.Checked )
      else
        Linie_Œpiewu__Widocznoœæ_CheckBox.Checked := file_ini.ReadBool( 'Opcje', 'linie_œpiewu__widocznoœæ', Linie_Œpiewu__Widocznoœæ_CheckBox.Checked );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'napisy' )  ) then
        begin

          zt_string_stream.Clear();
          Font__To_Stream__Save( zt_string_stream, Wymiar_Label );
          zt_string_stream.Position := 0;

          file_ini.WriteBinaryStream( 'Opcje', 'napisy', zt_string_stream );

          zt_string_stream.Clear();

        end
      else
        begin

          zt_string_stream.Clear();

          file_ini.ReadBinaryStream( 'Opcje', 'napisy', zt_string_stream );

          zt_string_stream.Position := 0;
          Font__From_Stream__Load( zt_string_stream, Wymiar_Label );
          zt_string_stream.Clear();

        end;


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'pliki__multimedialne_rozszerzenia' )  ) then
        file_ini.WriteString( 'Opcje', 'pliki__multimedialne_rozszerzenia', pliki__multimedialne_rozszerzenia_g )
      else
        pliki__multimedialne_rozszerzenia_g := file_ini.ReadString( 'Opcje', 'pliki__multimedialne_rozszerzenia', pliki__multimedialne_rozszerzenia_g );

      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 'pliki__napisów_rozszerzenia' )  ) then
        file_ini.WriteString( 'Opcje', 'pliki__napisów_rozszerzenia', pliki__napisów_rozszerzenia_g )
      else
        pliki__napisów_rozszerzenia_g := file_ini.ReadString( 'Opcje', 'pliki__napisów_rozszerzenia', pliki__napisów_rozszerzenia_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Opcje', 't³umaczenie' )  ) then
        file_ini.WriteString( 'Opcje', 't³umaczenie', T³umaczenie_ComboBox.Text )
      else
        t³umaczenie_nazwa_kopia_l := file_ini.ReadString( 'Opcje', 't³umaczenie', T³umaczenie_ComboBox.Text );



      // Parametry.

      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'czas__skok__du¿y_sekundy' )  ) then
        file_ini.WriteFloat( 'Parametry', 'czas__skok__du¿y_sekundy', czas__skok__du¿y_sekundy_g )
      else
        czas__skok__du¿y_sekundy_g := file_ini.ReadFloat( 'Parametry', 'czas__skok__du¿y_sekundy', czas__skok__du¿y_sekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'czas__skok__ma³y_sekundy' )  ) then
        file_ini.WriteFloat( 'Parametry', 'czas__skok__ma³y_sekundy', czas__skok__ma³y_sekundy_g )
      else
        czas__skok__ma³y_sekundy_g := file_ini.ReadFloat( 'Parametry', 'czas__skok__ma³y_sekundy', czas__skok__ma³y_sekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'czas__skok__minimalny_sekundy' )  ) then
        file_ini.WriteFloat( 'Parametry', 'czas__skok__minimalny_sekundy', czas__skok__minimalny_sekundy_g )
      else
        czas__skok__minimalny_sekundy_g := file_ini.ReadFloat( 'Parametry', 'czas__skok__minimalny_sekundy', czas__skok__minimalny_sekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'czas__skok__œredni_sekundy' )  ) then
        file_ini.WriteFloat( 'Parametry', 'czas__skok__œredni_sekundy', czas__skok__œredni_sekundy_g )
      else
        czas__skok__œredni_sekundy_g := file_ini.ReadFloat( 'Parametry', 'czas__skok__œredni_sekundy', czas__skok__œredni_sekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'mysz__kursor__ruch__ukrywanie__czas_sekundy' )  ) then
        file_ini.WriteInteger( 'Parametry', 'mysz__kursor__ruch__ukrywanie__czas_sekundy', mysz__kursor__ruch__ukrywanie__czas_sekundy_g)
      else
        mysz__kursor__ruch__ukrywanie__czas_sekundy_g := file_ini.ReadInteger( 'Parametry', 'mysz__kursor__ruch__ukrywanie__czas_sekundy', mysz__kursor__ruch__ukrywanie__czas_sekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'napisy__korekta_intensywnoœæ' )  ) then
        file_ini.WriteFloat( 'Parametry', 'napisy__korekta_intensywnoœæ', napisy__korekta_intensywnoœæ_g )
      else
        napisy__korekta_intensywnoœæ_g := file_ini.ReadFloat( 'Parametry', 'napisy__korekta_intensywnoœæ', napisy__korekta_intensywnoœæ_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'napisy__odœwie¿anie_milisekundy' )  ) then
        file_ini.WriteInteger( 'Parametry', 'napisy__odœwie¿anie_milisekundy', napisy__odœwie¿anie_milisekundy_g)
      else
        napisy__odœwie¿anie_milisekundy_g := file_ini.ReadInteger( 'Parametry', 'napisy__odœwie¿anie_milisekundy', napisy__odœwie¿anie_milisekundy_g );


      if   ( zapisz_f )
        or (  not file_ini.ValueExists( 'Parametry', 'napisy__synchronizacja_ponad_milisekundy' )  ) then
        file_ini.WriteFloat( 'Parametry', 'napisy__synchronizacja_ponad_milisekundy', napisy__synchronizacja_ponad_milisekundy_g )
      else
        napisy__synchronizacja_ponad_milisekundy_g := file_ini.ReadFloat( 'Parametry', 'napisy__synchronizacja_ponad_milisekundy', napisy__synchronizacja_ponad_milisekundy_g );

    end;
  //---//if not konfiguracja__tylko_f then
  {$endregion 'Ini file.'}


  file_ini.Free();


  zt_string_stream.Clear();
  FreeAndNil( zt_string_stream );


  if not zapisz_f then
    begin

      Napisy__Czcionka_Ustaw__Wszystkie();

      T³umaczenia__Lista__Wczytaj();


      if Trim( t³umaczenie_nazwa_kopia_l ) <> '' then
        for i := T³umaczenie_ComboBox.Items.Count - 1 downto 0 do
          if T³umaczenie_ComboBox.Items[ i ] = t³umaczenie_nazwa_kopia_l then
            begin

              T³umaczenie_ComboBox.ItemIndex := i;

              T³umaczenia__Zastosuj();

              T³umaczenia__Lista__Wczytaj(); // Aby odœwie¿yæ t³umaczenie s³ów kluczowych (np. 'domyœlne').


              Break;

            end;
          //---//if T³umaczenie_ComboBox.Items[ i ] = t³umaczenie_nazwa_kopia_l then


      G³oœnoœæ__Ustaw( g³oœnoœæ__poziom_l );

    end;
  //---//if not zapisz_f then

end;//---//Funkcja Ustawienia__Wczytaj_Zapisz().

//---//      ***      Funkcje      ***      //---//


constructor TNapis.Create( TheOwner : TComponent );
begin

  inherited;

  czas_od := -1;
  czas_do := -1;

  Self.Alignment := taCenter;

end;//---//Konstruktor klasy TNapis.

destructor TNapis.Destroy();
begin

  inherited;

end;//---//Destruktor klasy TNapis.

procedure TKaraoke_Mpv_Form.FormShow( Sender: TObject );
var
  i : integer;

  g³oœnoœæ__poziom_l : double;
begin

  czas__skok__du¿y_sekundy_g := 30;
  czas__skok__ma³y_sekundy_g := 3;
  czas__skok__minimalny_sekundy_g := 0.05;
  czas__skok__œredni_sekundy_g := 10;
  g³oœnoœæ__poziom__domyœlny_g := 40;
  g³oœnoœæ__poziom__maksymalny_g := 130;
  g³oœnoœæ__poziom__minimalny_g := 0;
  g³oœnoœæ__skok__du¿y_g := 10;
  g³oœnoœæ__skok__ma³y_g := 1;
  mysz__kursor__ruch__ostatni__data_czas_g := Now();
  mysz__kursor__ruch__ostatni__pozycja_g := Mouse.CursorPos;
  mpv_base_player_g := nil;
  mysz__kursor__ruch__ukrywanie__czas_sekundy_g := 1;
  mysz__przycisk_naciœniêty_g := false;
  mysz__przycisk_naciœniêty__x__start_g := 0;
  mysz__przycisk_naciœniêty__y__start_g := 0;
  napisy__korekta_intensywnoœæ_g := 0.1;
  napisy__odœwie¿anie_milisekundy_g := 30;
  napisy__synchronizacja_ponad_milisekundy_g := 1000;
  plik_adres__multimedialny_g := '';
  plik_adres__napisy_g := '';
  pliki__multimedialne_rozszerzenia_g := t³umaczenie__s³owo__multimedia_c + '|*.avi; *.mid; *.mov; *.mp3; *.mp4; *.mpeg; *.mpg; *.mpga; *.ogg; *.wave; *.webm; *.wmv;|' + t³umaczenie__s³owo__wszystkie_c + '|*.*';
  pliki__multimedialne_rozszerzenia__t³umaczenie_g := pliki__multimedialne_rozszerzenia_g;
  pliki__napisów_rozszerzenia_g := t³umaczenie__s³owo__eryzyjskie_c + '|*.esama_karaoke|' + t³umaczenie__s³owo__tekstowe_c + '|*.txt; *.srt|' + t³umaczenie__s³owo__wszystkie_c + '|*.*';
  pliki__napisów_rozszerzenia__t³umaczenie_g := pliki__napisów_rozszerzenia_g;
  zamykanie_g := false;

  Karaoke_Key_Down_Edit.Left := -100 - 2 * Karaoke_Key_Down_Edit.Width;


  Ekran_Panel.Align := alClient;

  PageControl1.ActivePage := Sterowanie_TabSheet;

  PageControl1.Width := panel_boczny_szerokoœæ_c;

  O_Programie_ScrollBox.HorzScrollBar.Position := 0;
  O_Programie_ScrollBox.VertScrollBar.Position := 0;

  Opcje_ScrollBox.HorzScrollBar.Position := 0;
  Opcje_ScrollBox.VertScrollBar.Position := 0;



  karaoke_handle_g := 0;

  if Jedno_Uruchomienie_Programu_CheckBox.Checked then
    begin

      karaoke_handle_g := CreateSemaphore( nil, 0, 1, 'Karaoke_Mpv__UNIKALNA_NAZWA' ); // uses Windows.

      if GetLastError = ERROR_ALREADY_EXISTS then
        begin

          Plik__Do_Uruchomienia__Dopisz();

          FreeAndNil( mpv_base_player_g );

          Halt;

        end;
      //---//if GetLastError = ERROR_ALREADY_EXISTS then

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then



  if not MPVBasePlayer.MPVLibLoaded( '' ) then
    Application.MessageBox( PChar(t³umaczenie_komunikaty_r.nie_uda³o_siê_wczytaæ__MPV_dll__), PChar(t³umaczenie_komunikaty_r.b³¹d), MB_OK + MB_ICONEXCLAMATION );


  pomoc_memo_tekst_kopia_g := Pomoc_Memo.Lines.Text;

  if FileExists(  ExtractFilePath( Application.ExeName ) + pomoc_o_programie__plik__nazwa_c  ) then
    begin

      Pomoc_Memo.Lines.LoadFromFile(  ExtractFilePath( Application.ExeName ) + pomoc_o_programie__plik__nazwa_c, TEncoding.UTF8  );

      pomoc_memo_tekst_kopia_g := Pomoc_Memo.Lines.Text;

    end;
  //---//if FileExists(  ExtractFilePath( Application.ExeName ) + pomoc_o_programie__plik__nazwa_c  ) then


  Napisy_Podgl¹d_Memo.Lines.Clear();


  T³umaczenia__Domyœlne();


  Ustawienia__Domyœlne_ButtonClick( Sender );

  g³oœnoœæ__poziom_l := Ustawienia__Wczytaj_Zapisz( false );


  Czas_Timer.Interval := napisy__odœwie¿anie_milisekundy_g;


  Napisy_Podgl¹d_Memo.Lines.Add( t³umaczenie_komunikaty_r.podgl¹d_napisów );


  Ekran_PanelResize( Sender );


  Systemowy_Timer.Enabled := true;



  mpv_base_player_g := MPVBasePlayer.TMPVBasePlayer.Create();
  mpv_base_player_g.InitPlayer(  IntToStr( Ekran_Panel.Handle ), '', '', '', false  ); // Dla Release x32 pojawia siê b³¹d dostêpu (access violation) lub w nowszym pliku libmpv-2.dll 'OpenSSL internal error assertion failed lock != NULL'.
  //mpv_base_player_g.OnProgress := MPV_Progress_Event; // Bez tego jest p³ynniej.
  mpv_base_player_g.OnStateChged := MPV_State_Changed;



  Winapi.ShellAPI.DragAcceptFiles( Self.Handle, true );


  G³oœnoœæ__Ustaw( g³oœnoœæ__poziom_l );



  for i := 1 to ParamCount do
    if Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz(  ParamStr( i )  ) then
      begin

        Napisy__Wczytaj( ParamStr( i ) );

        Break;

      end;
    //---//if Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz(  ParamStr( i )  ) then



  Karaoke_Key_Down_Set_Focus( Sender );

end;//---//FormShow().

procedure TKaraoke_Mpv_Form.FormClose( Sender: TObject; var Action: TCloseAction );
begin

  zamykanie_g := true;


  Czas_Timer.Enabled := false;
  Systemowy_Timer.Enabled := false;


  if karaoke_handle_g <> 0 then
    CloseHandle( karaoke_handle_g );


  Winapi.ShellAPI.DragAcceptFiles( Self.Handle, false );


  Ustawienia__Wczytaj_Zapisz( true, true );


  Napisy__Zwolnij();


  FreeAndNil( mpv_base_player_g );

end;//---//FormClose().

procedure TKaraoke_Mpv_Form.Karaoke_KeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
var
  ztdo : double;
begin

  if Key = VK_ESCAPE then
    begin

      if mysz__przycisk_naciœniêty_g then
        begin

          mysz__przycisk_naciœniêty_g := false;
          mysz__przycisk_naciœniêty__x__start_g := 0;
          mysz__przycisk_naciœniêty__y__start_g := 0;

        end
      else//if mysz__przycisk_naciœniêty_g then
        Pe³ny_Ekran( true );

    end
  else
  if Key = VK_F11 then
    Opcje_Panel_Ustaw()
  else
  if Key = VK_F12 then
    Opcje_Panel_Ustaw( true )
  else
  // Kursor lewo.
  if Key = VK_LEFT then
    begin

      Key := 0;

      if Shift = [ ssCtrl, ssShift ] then
        Skok_Do__Ty³u( czas__skok__minimalny_sekundy_g )
      else
        if ssCtrl in Shift then
          Skok_Do__Ty³u( czas__skok__œredni_sekundy_g )
        else
          if ssShift in Shift then
            Skok_Do__Ty³u( czas__skok__du¿y_sekundy_g )
          else
            Skok_Do__Ty³u( czas__skok__ma³y_sekundy_g );

    end
  else//if Key = VK_LEFT then
  // Kursor dó³, - (numeryczna).
  if Key in [ VK_DOWN, VK_SUBTRACT ] then
    begin

      if Key = VK_DOWN then
        ztdo := g³oœnoœæ__skok__du¿y_g
      else//if Key = VK_DOWN then
        ztdo := g³oœnoœæ__skok__ma³y_g;

      Key := 0;

      G³oœnoœæ__Zmieñ( -ztdo );

    end
  else//if Key in [ VK_DOWN, VK_SUBTRACT ] then
  // Kursor góra, + (numeryczna).
  if Key in [ VK_UP, VK_ADD ] then
    begin

      if Key = VK_UP then
        ztdo := g³oœnoœæ__skok__du¿y_g
      else//if Key = VK_UP then
        ztdo := g³oœnoœæ__skok__ma³y_g;

      Key := 0;

      G³oœnoœæ__Zmieñ( ztdo );

    end
  else//if Key in [ VK_UP, VK_ADD ] then
  // Kursor prawo.
  if Key = VK_RIGHT then
    begin

      Key := 0;

      if Shift = [ ssCtrl, ssShift ] then
        Skok_Do__Przodu( czas__skok__minimalny_sekundy_g )
      else
        if ssCtrl in Shift then
          Skok_Do__Przodu( czas__skok__œredni_sekundy_g )
        else
          if ssShift in Shift then
            Skok_Do__Przodu( czas__skok__du¿y_sekundy_g )
          else
            Skok_Do__Przodu( czas__skok__ma³y_sekundy_g );

    end
  else//if Key = VK_RIGHT then
  if Key = VK_OEM_2 then // ?
    Self.Pomoc_BitBtnClick( Sender )
  else
  // [.
  if Key = VK_OEM_4 then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Przesuniêcie_Napisów_SpinEdit.Value := Przesuniêcie_Napisów_SpinEdit.Value + 500
      else//if ssCtrl in Shift then
        Przesuniêcie_Napisów_SpinEdit.Value := Przesuniêcie_Napisów_SpinEdit.Value + 100;

      Informacja_Tekst_Wyœwietl(  IntToStr( Przesuniêcie_Napisów_SpinEdit.Value ) + ' [ms]'  );

    end
  else//if Key = VK_OEM_4 then
  // ].
  if Key = VK_OEM_6 then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Przesuniêcie_Napisów_SpinEdit.Value := Przesuniêcie_Napisów_SpinEdit.Value - 500
      else//if ssCtrl in Shift then
        Przesuniêcie_Napisów_SpinEdit.Value := Przesuniêcie_Napisów_SpinEdit.Value - 100;

      Informacja_Tekst_Wyœwietl(  IntToStr( Przesuniêcie_Napisów_SpinEdit.Value ) + ' [ms]'  );

    end
  else//if Key = VK_OEM_6 then
  // '.
  if Key = VK_OEM_7 then
    begin

      Key := 0;

      Przesuniêcie_Napisów_SpinEdit.Value := 0;

      Informacja_Tekst_Wyœwietl(  IntToStr( Przesuniêcie_Napisów_SpinEdit.Value ) + ' [ms]'  );

    end
  else//if Key = VK_OEM_7 then
  if Key = VK_SPACE then
    Pauza()
  else
  // F.
  if   ( Key = 70 )
    or ( Key = VK_RETURN ) then
    begin

      Pe³ny_Ekran();


      if    ( Key = 70 )
        and ( Self.WindowState = wsMaximized )
        and ( Opcje_Splitter.Visible ) then
        begin

          Opcje_Panel_Ustaw( true );

          if Opcje_Splitter.Visible then
            Opcje_Panel_Ustaw( true );

        end;
      //---//if    ( Key = 70 ) (...)


      Key := 0;

    end
  else//if Key = VK_F then
  // L.
  if Key = 76 then
    Linie_Œpiewu__Widocznoœæ_CheckBox.Checked := not Linie_Œpiewu__Widocznoœæ_CheckBox.Checked
  else
  // M.
  if Key = 77 then
    G³oœnoœæ__Zmieñ( 0, true )
  else
  // N.
  if    ( Key = 78 )
    and ( Shift = [ ssCtrl, ssShift ] ) then
    Napisy__Zwolnij()
  else
  // N.
  if    ( Key = 78 )
    and ( Shift = [ ssCtrl ] ) then
    Plik__Napisy__Otwórz_ButtonClick( Sender )
  else
  // N.
  if Key = 78 then
    begin

      if   (  Trim( plik_adres__napisy_g ) = ''  )
        or (  not FileExists( plik_adres__napisy_g )  ) then
        Plik__Napisy__Otwórz_ButtonClick( Sender )
      else//if   (  Trim( plik_adres__napisy_g ) = ''  ) (...)
        Napisy__Wczytaj( plik_adres__napisy_g );

    end
  else//if Key = 78 then
  // O.
  if    ( Key = 79 )
    and ( Shift = [ ssCtrl ] ) then
    Plik__Multimedialny__Otwórz_ButtonClick( Sender )
  else
  // O.
  if Key = 79 then
    Odtwarzaj_ButtonClick( Sender )
  else
  // P.
  if Key = 80 then
    Pauza_ButtonClick( Sender )
  else
  // S.
  if Key = 83 then
    Stop_ButtonClick( Sender )
  else
  // X.
  if Key = 88 then
    Napisy__Zwolnij();

end;//---//Karaoke_KeyDown().

procedure TKaraoke_Mpv_Form.Karaoke_Key_Down_Set_Focus( Sender: TObject );
begin

  Karaoke_Key_Down_Edit.SetFocus();

end;//---//Karaoke_Key_Down_Set_Focus().

procedure TKaraoke_Mpv_Form.Karaoke_MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if mysz__kursor__ruch__ostatni__pozycja_g <> Mouse.CursorPos then
    begin

      // Ekran_Panel i napisy (TNapis) wywo³uj¹ zdarzenie nawet je¿eli mysz siê nie porusza.

      Screen.Cursor := crDefault;

      mysz__kursor__ruch__ostatni__pozycja_g := Mouse.CursorPos;

      mysz__kursor__ruch__ostatni__data_czas_g := Now();

    end;
  //---//if mysz__kursor__ruch__ostatni__pozycja_g <> Mouse.CursorPos then


  if mysz__przycisk_naciœniêty_g then
    Mysz__Przycisk_Naciœniêty__Procent_Wylicz( X, Y );

end;//---//Karaoke_MouseMove().

procedure TKaraoke_Mpv_Form.FormMouseWheelDown( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
begin

  if    ( PageControl1.Visible )
    and ( MousePos.X > Self.Left + Ekran_Panel.Width ) // Bez obszaru opcji.
    and ( MousePos.X < Self.Left + Self.Width ) then
    Exit;


  G³oœnoœæ__Zmieñ( -g³oœnoœæ__skok__ma³y_g );

end;//---//FormMouseWheelDown().

procedure TKaraoke_Mpv_Form.FormMouseWheelUp( Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean );
begin

  if    ( PageControl1.Visible )
    and ( MousePos.X > Self.Left + Ekran_Panel.Width ) // Bez obszaru opcji.
    and ( MousePos.X < Self.Left + Self.Width ) then
    Exit;


  G³oœnoœæ__Zmieñ( g³oœnoœæ__skok__ma³y_g );

end;//---//FormMouseWheelUp().

procedure TKaraoke_Mpv_Form.Czas_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Czas_Pasek_Click( X );

end;//---//Czas_ProgressBarMouseDown().

procedure TKaraoke_Mpv_Form.Czas_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Czas_Pasek_Click( X );


  Karaoke_MouseMove( Sender, Shift, X, Y );

end;//---//Czas_ProgressBarMouseMove().

procedure TKaraoke_Mpv_Form.Czas_TimerTimer( Sender: TObject );
var
  ztdo : double;
begin

  if mpv_base_player_g = nil then
    Exit;


  if Czas_Timer.Enabled then
    Czas_Timer.Enabled := false;


  Czas__Postêp_Wyœwietl( mpv_base_player_g.CurrentSeconds, mpv_base_player_g.TotalSeconds );


  if mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPlay ] then
    begin

      czas_aktualny_milisekundy_g := czas_aktualny_milisekundy_g + Czas_Timer.Interval;

      ztdo := mpv_base_player_g.CurrentSeconds * 1000 - czas_aktualny_milisekundy_g;

      if Abs( ztdo ) >= napisy__synchronizacja_ponad_milisekundy_g then
        Czas__Aktualny_Ustaw()
      else
      if ztdo <> 0 then
        czas_aktualny_milisekundy_g := czas_aktualny_milisekundy_g + ztdo * napisy__korekta_intensywnoœæ_g;

    end
  else//if mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPlay ] then
    Czas__Aktualny_Ustaw();


  Napisy__Przelicz( czas_aktualny_milisekundy_g );


  Czas_Timer_Enabled_Ustaw();

end;//---//Czas_TimerTimer().

procedure TKaraoke_Mpv_Form.Ekran_PanelMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  mysz__przycisk_naciœniêty_g := true;
  mysz__przycisk_naciœniêty__x__start_g := X;
  mysz__przycisk_naciœniêty__y__start_g := Y;

end;//---//Ekran_PanelMouseDown().

procedure TKaraoke_Mpv_Form.Ekran_PanelMouseUp( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  Mysz__Przycisk_Naciœniêty__Procent_Wylicz( X, Y, true );

  mysz__przycisk_naciœniêty_g := false;
  mysz__przycisk_naciœniêty__x__start_g := 0;
  mysz__przycisk_naciœniêty__y__start_g := 0;

end;//---Ekran_PanelMouseUp().

procedure TKaraoke_Mpv_Form.Ekran_PanelResize( Sender: TObject );
begin

  if Linie_Œpiewu__Wielkoœæ_SpinEdit.Value < 0 then
    Linie_Œpiewu__Wielkoœæ_SpinEdit.Value := 0;


  Linia_Œpiewu__Dó³_StaticText.Left := Ekran_Panel.Left;
  Linia_Œpiewu__Dó³_StaticText.Width := Ekran_Panel.Width;
  Linia_Œpiewu__Dó³_StaticText.Top := Ekran_Panel.Top + Round( Ekran_Panel.Height * 0.5 ) + Linie_Œpiewu__Pozycja_Okreœl();
  Linia_Œpiewu__Góra_StaticText.Top := Linia_Œpiewu__Dó³_StaticText.Top;
  Linia_Œpiewu__Dó³_StaticText.Top := Linia_Œpiewu__Dó³_StaticText.Top + Linie_Œpiewu__Odstêp_Okreœl();
  Linia_Œpiewu__Dó³_StaticText.Height := Linie_Œpiewu__Wielkoœæ_SpinEdit.Value;

  Linia_Œpiewu__Góra_StaticText.Left := Linia_Œpiewu__Dó³_StaticText.Left;
  Linia_Œpiewu__Góra_StaticText.Width := Linia_Œpiewu__Dó³_StaticText.Width;
  Linia_Œpiewu__Góra_StaticText.Top := Linia_Œpiewu__Góra_StaticText.Top - Linie_Œpiewu__Odstêp_Okreœl();
  Linia_Œpiewu__Góra_StaticText.Height := Linia_Œpiewu__Dó³_StaticText.Height;

end;//---//Ekran_PanelResize().

procedure TKaraoke_Mpv_Form.G³oœnoœæ_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    G³oœnoœæ__Pasek__Click( X );

end;//---//G³oœnoœæ_ProgressBarMouseDown().

procedure TKaraoke_Mpv_Form.G³oœnoœæ_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    G³oœnoœæ__Pasek__Click( X );


  Karaoke_MouseMove( Sender, Shift, X, Y );

end;//---//G³oœnoœæ_ProgressBarMouseMove().

procedure TKaraoke_Mpv_Form.Linie_Œpiewu__Kolor_ButtonClick( Sender: TObject );
begin

  ColorDialog1.Color := Linia_Œpiewu__Dó³_StaticText.Color;

  if ColorDialog1.Execute() then
    begin

      Linia_Œpiewu__Dó³_StaticText.Color := ColorDialog1.Color;
      Linia_Œpiewu__Góra_StaticText.Color := Linia_Œpiewu__Dó³_StaticText.Color;

    end;
  //---//if ColorDialog1.Execute() then

end;//---//Linie_Œpiewu__Kolor_ButtonClick().

procedure TKaraoke_Mpv_Form.Linie_Œpiewu__Widocznoœæ_CheckBoxClick( Sender: TObject );
begin

  Linia_Œpiewu__Dó³_StaticText.Visible := Linie_Œpiewu__Widocznoœæ_CheckBox.Checked;
  Linia_Œpiewu__Góra_StaticText.Visible := Linia_Œpiewu__Dó³_StaticText.Visible;

end;//---//Linie_Œpiewu__Widocznoœæ_CheckBoxClick().

procedure TKaraoke_Mpv_Form.LinkLabelLinkClick( Sender: TObject; const Link: string; LinkType: TSysLinkType );
begin

  if Trim( Link ) <> '' then
    ShellExecuteW( 0, 'Open', PWideChar(Link), nil, nil, SW_SHOWDEFAULT );

end;//---//LinkLabelLinkClick().

procedure TKaraoke_Mpv_Form.Napisy__Czcionka_T³o_ButtonClick( Sender: TObject );
var
  ztb : boolean;
begin

  ztb := false;

  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Napisy__T³o_Button.Name ) then
    begin

      ColorDialog1.Color := Wymiar_Label.Color;

      if ColorDialog1.Execute() then
        begin

          ztb := true;

          Wymiar_Label.Color := ColorDialog1.Color;

        end;
      //---//if ColorDialog1.Execute() then

    end
  else//if    ( Sender <> nil ) (...)
    begin

      FontDialog1.Font := Wymiar_Label.Font;

      if FontDialog1.Execute() then
        begin

          ztb := true;

          Wymiar_Label.Font := FontDialog1.Font;

        end;
      //---//if FontDialog1.Execute() then

    end;
  //---//if    ( Sender <> nil ) (...)


  if ztb then
    Napisy__Czcionka_Ustaw__Wszystkie();

end;//---//Napisy__Czcionka_T³o_ButtonClick().

procedure TKaraoke_Mpv_Form.Odtwarzaj_ButtonClick( Sender: TObject );
begin

  if   (  Trim( plik_adres__multimedialny_g ) = ''  )
    or (  not FileExists( plik_adres__multimedialny_g )  ) then
    begin

      Plik__Multimedialny__Otwórz_ButtonClick( Sender );

      Exit;

    end;
  //---//if   (  Trim( plik_adres__multimedialny_g ) = ''  ) (...)


  if    ( mpv_base_player_g <> nil )
    and (  not ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsLoading, MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )  ) then
    begin

      Plik__Multimedialny__Otwórz( plik_adres__multimedialny_g, false );

      Exit;

    end;
  //---//if    ( mpv_base_player_g <> nil ) (...)


  Informacja_Tekst_Wyœwietl( 'Odtwarzaj' );


  if mpv_base_player_g = nil then
    Exit;


  mpv_base_player_g.Resume();

end;//---//Odtwarzaj_ButtonClick().

procedure TKaraoke_Mpv_Form.Pauza_ButtonClick( Sender: TObject );
begin

  Informacja_Tekst_Wyœwietl( 'Pauza' );


  if   ( mpv_base_player_g = nil )
    or (  not ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )  ) then
    Exit;


  mpv_base_player_g.Pause();

end;//---//Pauza_ButtonClick().

procedure TKaraoke_Mpv_Form.Plik__Do_Uruchomienia__Dopisz();
var
  i : integer;

  zts,
  œcie¿ka_do_pliku
    : string;

  zt_string_list_l : TStringList;
begin

  œcie¿ka_do_pliku := '';


  for i := 0 to ParamCount do
    begin

      // Sprawdza czy w parametrach jest adres jakiegoœ pliku do otworzenia.

      zts := AnsiLowerCase(   ExtractFileExt(  ParamStr( i )  )   );

      if Pos( '.exe', zts ) > 0 then
        Continue;

      œcie¿ka_do_pliku := ParamStr( i );

    end;
  //---//for i := 0 to ParamCount do


  if Trim( œcie¿ka_do_pliku ) = '' then
    Exit;

  i := 0;
  zts := ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c;

  while i <= 5 do
    begin

      if FileExists( zts ) then // Sprawdza czy istnieje plik.
        begin

          // Istnieje.
          // Je¿eli plik istnieje - jest przetwarzany przez inn¹ instancjê programu, oczekiwanie na zakoñczenie przetwarzania.

          inc( i );


          if i >= 5 then
            Exit;

          Sleep( 1000 );

        end
      else//if FileExists( zts ) then
        Break; // Nie istnieje.

    end;
  //---//while i <= 5 do

  zt_string_list_l := TStringList.Create();

  zt_string_list_l.Add( '' );
  zt_string_list_l.Add( œcie¿ka_do_pliku );

  zt_string_list_l.SaveToFile( zts, TEncoding.UTF8 );

  FreeAndNil( zt_string_list_l );

end;//---//Funkcja Plik__Do_Uruchomienia__Dopisz().

procedure TKaraoke_Mpv_Form.Plik__Multimedialny__Otwórz_ButtonClick( Sender: TObject );
begin

  OpenDialog1.Filter := pliki__multimedialne_rozszerzenia__t³umaczenie_g;


  if OpenDialog1.Execute() then
    Plik__Multimedialny__Otwórz( OpenDialog1.FileName );

end;//---//Plik__Multimedialny__Otwórz_ButtonClick().

procedure TKaraoke_Mpv_Form.Plik__Napisy__Otwórz_ButtonClick( Sender: TObject );
begin

  OpenDialog1.Filter := pliki__napisów_rozszerzenia__t³umaczenie_g;


  if OpenDialog1.Execute() then
    Napisy__Wczytaj( OpenDialog1.FileName );

end;//---//Plik__Napisy__Otwórz_ButtonClick().

procedure TKaraoke_Mpv_Form.Pomoc_BitBtnClick( Sender: TObject );
begin

  ShowMessage( t³umaczenie_komunikaty_r.pomoc );

end;//---//Pomoc_BitBtnClick().

procedure TKaraoke_Mpv_Form.Skok_Do__Przodu_ButtonClick( Sender: TObject );
begin

  Skok_Do__Przodu();

end;//---//Skok_Do__Przodu_ButtonClick().

procedure TKaraoke_Mpv_Form.Skok_Do__Ty³u_ButtonClick( Sender: TObject );
begin

  Skok_Do__Ty³u();

end;//---//Skok_Do__Ty³u_ButtonClick().

procedure TKaraoke_Mpv_Form.Stop_ButtonClick( Sender: TObject );
begin

  Informacja_Tekst_Wyœwietl( 'Stop' );


  if mpv_base_player_g = nil then
    Exit;


  mpv_base_player_g.Stop();

end;//---//Stop_ButtonClick().

procedure TKaraoke_Mpv_Form.Systemowy_TimerTimer( Sender: TObject );
var
  zt_form_style : TFormStyle;

  zts : string;

  zt_string_list_l : TStringList;
begin

  if zamykanie_g then
    begin

      Systemowy_Timer.Enabled := false;
      Exit;

    end;
  //---//if zamykanie_g then


  if    ( Czas_ProgressBar.Max = 0 )
    and ( mpv_base_player_g <> nil )
    and ( mpv_base_player_g.GetState() in [ MPVBasePlayer.mpsPause, MPVBasePlayer.mpsPlay ] )
    and ( mpv_base_player_g.TotalSeconds >= 0 ) then
    Czas_ProgressBar.Max := System.Math.Floor( mpv_base_player_g.TotalSeconds * czas__pasek_skala_c );


  if    ( Self.WindowState = wsMaximized )
    and (  System.DateUtils.SecondsBetween( Now(), mysz__kursor__ruch__ostatni__data_czas_g ) >= mysz__kursor__ruch__ukrywanie__czas_sekundy_g  ) then
    Screen.Cursor := crNone;


  if Jedno_Uruchomienie_Programu_CheckBox.Checked then
    begin

      Systemowy_Timer.Enabled := false;


      zts := ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c;

      if FileExists( zts ) then // Sprawdza czy istnieje plik.
        begin

          // Istnieje.

          zt_string_list_l := TStringList.Create();

          try
            zt_string_list_l.LoadFromFile( zts, TEncoding.UTF8 );
          except
            on E : Exception do
              begin

                FreeAndNil( zt_string_list_l );

                Exit;

              end;
            //---//on E: Exception do
          end;
          //---//try


          if zt_string_list_l.Count >= 2 then
            zts := zt_string_list_l[ 1 ]; // Druga linijka.

          FreeAndNil( zt_string_list_l );

          DeleteFile(   PChar(  ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c  )   );


          Napisy__Wczytaj( zts );

          Plik__Multimedialny__Pasuj¹cy_Do__Napisów__Otwórz( zts );


          zt_form_style := Self.FormStyle;

          Application.BringToFront(); //  Mo¿e nie zadzia³aæ ze wzglêdu na zabezpieczenia Windows odnoœnie podmieniania skupienia.

          Self.FormStyle := fsStayOnTop;
          Self.FormStyle := zt_form_style;

        end;
      //---//if FileExists( zts ) then


      Systemowy_Timer.Enabled := true;

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then

end;//---//Systemowy_TimerTimer().

procedure TKaraoke_Mpv_Form.T³umaczenie_ComboBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  if Key = VK_RETURN then
    begin

      T³umaczenia__Zastosuj();

      T³umaczenia__Lista__Wczytaj(); // Aby odœwie¿yæ t³umaczenie s³ów kluczowych (np. 'domyœlne').

    end
  else//if Key = VK_RETURN then
  // R.
  if    ( Key = 82 )
    and ( Shift = [ ssCtrl ] ) then
    T³umaczenia__Lista__Wczytaj();

end;//---//T³umaczenie_ComboBoxKeyDown().

procedure TKaraoke_Mpv_Form.Ustawienia__Domyœlne_ButtonClick( Sender: TObject );
begin

  Screen.Cursor := crHourGlass;


  Jedno_Uruchomienie_Programu_CheckBox.Checked := true;

  Linia_Œpiewu__Dó³_StaticText.Color :=  clSkyBlue;
  Linia_Œpiewu__Góra_StaticText.Color := Linia_Œpiewu__Dó³_StaticText.Color;
  Linie_Œpiewu__Odstêp_SpinEdit.Value := 6;
  Linie_Œpiewu__Pozycja_SpinEdit.Value := 0;
  Linie_Œpiewu__Wielkoœæ_SpinEdit.Value := 10;
  Linie_Œpiewu__Widocznoœæ_CheckBox.Checked := true;

  Przesuniêcie_Napisów_SpinEdit.Value := 0;

  Wymiar_Label.Color := 8404992; // Granatowy.
  Wymiar_Label.Font.Color := clWhite;
  Wymiar_Label.Font.Name := 'Georgia';
  Wymiar_Label.Font.Size := 44;
  Wymiar_Label.Font.Style := [];


  Napisy__Czcionka_Ustaw__Wszystkie();


  G³oœnoœæ__Ustaw( g³oœnoœæ__poziom__domyœlny_g );


  Screen.Cursor := crDefault;

end;//---//Ustawienia__Domyœlne_ButtonClick().

procedure TKaraoke_Mpv_Form.Ustawienia__Wczytaj_Zapisz_ButtonClick( Sender: TObject );
begin

  if    ( Sender <> nil )
    and ( Sender = Ustawienia__Zapisz_Button ) then
    Ustawienia__Wczytaj_Zapisz( true )
  else
    Ustawienia__Wczytaj_Zapisz( false );

end;//---//Ustawienia__Wczytaj_ButtonClick().

end.
