unit languajecontrol;

 interface

 implementation

 uses
   Windows, Consts;

 // Assign new value to a resource string
 procedure HookResourceString(ResStringRec: pResStringRec; NewStr: pChar) ;
 var
   OldProtect: DWORD;
 begin
   VirtualProtect(ResStringRec, SizeOf(ResStringRec^), PAGE_EXECUTE_READWRITE, @OldProtect) ;
   ResStringRec^.Identifier := Integer(NewStr) ;
   VirtualProtect(ResStringRec, SizeOf(ResStringRec^), OldProtect, @OldProtect) ;
 end;

 initialization
   HookResourceString(@SCannotOpenClipboard, 'No se puede abrir porta-papeles') ;
   HookResourceString(@SMsgDlgWarning, 'Atencion') ;
   HookResourceString(@SMsgDlgError, 'Error') ;
   HookResourceString(@SMsgDlgInformation, 'Informacion') ;
   HookResourceString(@SMsgDlgConfirm, 'Confirmar') ;
   HookResourceString(@SMsgDlgYes, 'Si') ;
   HookResourceString(@SMsgDlgNo, 'No') ;
   HookResourceString(@SMsgDlgOK, 'OK') ;
   HookResourceString(@SMsgDlgCancel, 'Anula') ;
   HookResourceString(@SMsgDlgHelp, 'Ayuda') ;
   HookResourceString(@SMsgDlgHelpNone, 'No hay ayuda') ;
   HookResourceString(@SMsgDlgHelpHelp, 'Ayuda') ;
   HookResourceString(@SMsgDlgAbort, 'Abortar') ;
   HookResourceString(@SMsgDlgRetry, 'Reintentar') ;
   HookResourceString(@SMsgDlgIgnore, 'Ignorar') ;
   HookResourceString(@SMsgDlgAll, 'Todos') ;
   HookResourceString(@SMsgDlgNoToAll, 'No a todos') ;
   HookResourceString(@SMsgDlgYesToAll, 'Si a todos') ;
 end.
