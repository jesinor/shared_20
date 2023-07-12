unit browse;

interface

  function BrowseURL(const URL: string) : boolean;
  function BrowseURL_IE( const URL: string ): boolean;

implementation

uses
   windows, Registry, ShellAPI;

function BrowseURL_IE(const URL: string) : boolean;
var
   Browser: string;
begin
   Result := True;
   Browser := '';
   with TRegistry.Create do
   try
      RootKey := HKEY_CLASSES_ROOT;
      Access := KEY_QUERY_VALUE;
      if OpenKey('\htmlfile\shell\open\command', False) then
        Browser := ReadString('') ;
      CloseKey;
   finally
     Free;
   end;
   if Browser = '' then
   begin
     Result := False;
     Exit;
   end;
   Browser := Copy(Browser, Pos('"', Browser) + 1, Length(Browser)) ;
   Browser := Copy(Browser, 1, Pos('"', Browser) - 1) ;
   ShellExecute(0, 'open', PChar(Browser), PChar(URL), nil, SW_SHOW) ;
end;

function BrowseURL( const URL: string ): boolean;
var
   Browser: string;
begin
   Result := True;
   ShellExecute(0, 'OPEN', PChar(URL), '', '', SW_SHOWNORMAL);
end;


//Usage
// BrowseURL('http:delphi.about.com') ;
end.
