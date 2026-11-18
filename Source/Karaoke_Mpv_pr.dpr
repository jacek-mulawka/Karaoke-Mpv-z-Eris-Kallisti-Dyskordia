program Karaoke_Mpv_pr;

uses
  Vcl.Forms,
  Karaoke_Mpv in 'Karaoke_Mpv.pas' {Karaoke_Mpv_Form},
  MPVBasePlayer in 'LibMPVDelphi\MPVBasePlayer.pas',
  MPVClient in 'LibMPVDelphi\MPVClient.pas',
  MPVConst in 'LibMPVDelphi\MPVConst.pas',
  MPVNode in 'LibMPVDelphi\MPVNode.pas',
  MPVRender in 'LibMPVDelphi\MPVRender.pas',
  MPVRenderGL in 'LibMPVDelphi\MPVRenderGL.pas',
  MPVStreamCB in 'LibMPVDelphi\MPVStreamCB.pas',
  MPVTrack in 'LibMPVDelphi\MPVTrack.pas';

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize();
  Application.MainFormOnTaskbar := True;
  Application.HintHidePause := 30000;
  Application.CreateForm( TKaraoke_Mpv_Form, Karaoke_Mpv_Form );
  Application.Run();

end.
