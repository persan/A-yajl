with Interfaces.C.Strings;
private with Ada.Finalization;
private with LibYajl.Parse_H;
package Yajl.Parsers is
   use Interfaces.C;

   type Status is
     (Ok,
      Client_Canceled,
      Insufficient_Data,
      Error);

   function Status_To_String (Code : Status) return Interfaces.C.Strings.Chars_Ptr;

   type ContentHandler is interface;
   type Any_ContentHandler is access all ContentHandler'Class;

   type Context is interface;
   type Any_Context is access all Context'Class;

   procedure On_Null (Self : ContentHandler;
                      Ctx  : not null Any_Context) is null;
   procedure On_Boolean (Self : ContentHandler;
                         Ctx  : not null Any_Context;
                         Value : Boolean) is null;
   procedure On_Integer (Self : ContentHandler;
                         Ctx  : not null Any_Context;
                         Value : Integer) is null;
   procedure On_Double (Self : ContentHandler;
                        Ctx  : not null Any_Context;
                        Value : Long_Float ) is null;
   procedure On_Number
     (self : ContentHandler; ctx : not null Any_Context;
      Value : Interfaces.C.Strings.Chars_Ptr;
      Arg3 : Unsigned) is null;
   procedure On_String
     (self : ContentHandler; ctx : not null Any_Context;
      Value : access String;
      Arg3 : Unsigned) is null;
   procedure On_Start_Map (Self : ContentHandler;
                           Ctx  : not null Any_Context) is null;
   procedure On_Map_Key
     (Self : ContentHandler;
      Ctx  : not null Any_Context;
      Arg2 : access Unsigned_Char;
      Arg3 : Unsigned) is null;
   procedure On_End_Map (Self : ContentHandler;
                         Ctx  : not null Any_Context) is null;
   procedure On_Start_Array (Self : ContentHandler;
                             Ctx  : not null Any_Context) is null;
   procedure On_End_Array (Self : ContentHandler;
                           Ctx  : not null Any_Context) is null;

   procedure Parse_Start (Self : ContentHandler) is null;
   --  Called before each stream is parsed

   procedure Parse_Buf (Self : ContentHandler) is null;
   --  Called when a complete buffer has been parsed from the stream

   procedure Parse_Complete (Self : ContentHandler) is null;
   --  Called when the parsing of the stream has finished

   type Parser (Cb            : not null access ContentHandler'Class;
                AllowComments : Boolean;
                CheckUTF8     : Boolean;
                Ctx           : not null Any_Context) is tagged limited private;
   type Any_Parser is access all Parser'Class;

   function Parse
     (Hand           : Parser;
      JsonText       : access Unsigned_Char;
      JsonTextLength : Unsigned) return Status;

   function Parse_Complete (Hand : Parser) return Status;

   function Get_Error
     (Hand           : Parser;
      Verbose        : Boolean;
      JsonText       : access Unsigned_Char;
      JsonTextLength : Unsigned) return access Unsigned_Char;

   function Bytes_Consumed (Hand : Parser) return Natural;

   procedure Free_Error (Hand : Parser;
                         Str  : access Unsigned_Char);

private
   type Parser (Cb            : not null access  ContentHandler'Class;
                AllowComments : Boolean;
                CheckUTF8     : Boolean;
                Ctx           : not null Any_Context)
     is new Ada.Finalization.Limited_Controlled with record
      Handle : LibYajl.Parse_H.Yajl_Handle;
   end record;
   procedure Initialize (Object : in out Parser);
   procedure Finalize   (Object : in out Parser);

end Yajl.Parsers;
