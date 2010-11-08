package body Yajl.Parsers is

   ----------------------
   -- Status_To_String --
   ----------------------

   function Status_To_String
     (Code : Status)
      return Interfaces.C.Strings.Chars_Ptr
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Status_To_String unimplemented");
      raise Program_Error with "Unimplemented function Status_To_String";
      return Status_To_String (Code);
   end Status_To_String;

   ----------
   -- Free --
   ----------

   procedure Free (Parser : in out Any_Parser) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Free unimplemented");
      raise Program_Error with "Unimplemented procedure Free";
   end Free;

   -----------
   -- Parse --
   -----------

   function Parse
     (Hand           : Parser;
      JsonText       : access Unsigned_Char;
      JsonTextLength : Unsigned)
      return Status
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Parse unimplemented");
      raise Program_Error with "Unimplemented function Parse";
      return Parse (Hand, JsonText, JsonTextLength);
   end Parse;

   --------------------
   -- Parse_Complete --
   --------------------

   function Parse_Complete (Hand : Parser) return Status is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Parse_Complete unimplemented");
      raise Program_Error with "Unimplemented function Parse_Complete";
      return Parse_Complete (Hand);
   end Parse_Complete;

   ---------------
   -- Get_Error --
   ---------------

   function Get_Error
     (Hand           : Parser;
      Verbose        : Boolean;
      JsonText       : access Unsigned_Char;
      JsonTextLength : Unsigned)
      return access Unsigned_Char
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Get_Error unimplemented");
      raise Program_Error with "Unimplemented function Get_Error";
      return Get_Error (Hand, Verbose, JsonText, JsonTextLength);
   end Get_Error;

   --------------------
   -- Bytes_Consumed --
   --------------------

   function Bytes_Consumed (Hand : Parser) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Bytes_Consumed unimplemented");
      raise Program_Error with "Unimplemented function Bytes_Consumed";
      return Bytes_Consumed (Hand);
   end Bytes_Consumed;

   ----------------
   -- Free_Error --
   ----------------

   procedure Free_Error
     (Hand : Parser;
      Str  : access Unsigned_Char)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Free_Error unimplemented");
      raise Program_Error with "Unimplemented procedure Free_Error";
   end Free_Error;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out Parser) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Initialize unimplemented");
      raise Program_Error with "Unimplemented procedure Initialize";
   end Initialize;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Parser) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

end Yajl.Parsers;
