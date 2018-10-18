[Setup]
AppID=FlexASIO
AppName=FlexASIO
AppVerName=FlexASIO 0.2
AppVersion=0.2
AppPublisher=Etienne Dechamps
AppPublisherURL=https://github.com/dechamps/FlexASIO
AppSupportURL=https://github.com/dechamps/FlexASIO
AppUpdatesURL=https://github.com/dechamps/FlexASIO
AppContact=etienne@edechamps.fr

OutputDir=build
OutputBaseFilename=FlexASIO-0.2

DefaultDirName={pf}\FlexASIO
AppendDefaultDirName=no
ArchitecturesInstallIn64BitMode=x64

LicenseFile=LICENSE.txt

[Files]
Source:"build\x64\Release\FlexASIO_x64.dll"; DestDir: "{app}"; Flags: ignoreversion regserver 64bit; Check: Is64BitInstallMode
Source:"build\x86\Release\FlexASIO_x86.dll"; DestDir: "{app}"; Flags: ignoreversion regserver 32bit
Source:"LICENSE.txt"; DestDir:"{app}"; Flags: ignoreversion

; PortAudio library.
; Note that these are not actually build artefacts; you need to put them there manually.
; The reason why this is fetching these DLLs from build is because it's convenient to have them there during testing.
Source:"build\x64\Release\portaudio_x64.dll"; DestDir: "{app}"; Flags: ignoreversion 64bit; Check: Is64BitInstallMode
Source:"build\x86\Release\portaudio_x86.dll"; DestDir: "{app}"; Flags: ignoreversion 32bit

; Microsoft Visual C++ 2017 runtime
; From: (Visual Studio 2017 install dir)\Community\VC\Redist\MSVC\14.15.26706
Source: "redist\vcredist_x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall 64bit; Check: Is64BitInstallMode
Source: "redist\vcredist_x86.exe"; DestDir: {tmp}; Flags: deleteafterinstall 32bit

[Run]
Filename:"{tmp}\vcredist_x64.exe"; Parameters: "/passive"; StatusMsg: "Installing Microsoft Visual C++ 2017 runtime (x64)"; Flags: 64bit; Check: Is64BitInstallMode
Filename:"{tmp}\vcredist_x86.exe"; Parameters: "/passive"; StatusMsg: "Installing Microsoft Visual C++ 2017 runtime (x86)"; Flags: 32bit
 