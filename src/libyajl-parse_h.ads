with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with libYajl.common_h;

package libYajl.parse_h is

   type yajl_status is 
     (yajl_status_ok,
      yajl_status_client_canceled,
      yajl_status_insufficient_data,
      yajl_status_error);
   pragma Convention (C, yajl_status);  -- yajl/yajl_parse.h:59

   function yajl_status_to_string (code : yajl_status) return Interfaces.C.Strings.chars_ptr;  -- yajl/yajl_parse.h:62
   pragma Import (C, yajl_status_to_string, "yajl_status_to_string");

   --  skipped empty struct yajl_handle_t

   type yajl_handle is new System.Address;  -- yajl/yajl_parse.h:65

   type yajl_callbacks is record
      yajl_null : access function (arg1 : System.Address) return int;  -- yajl/yajl_parse.h:89
      yajl_boolean : access function (arg1 : System.Address; arg2 : int) return int;  -- yajl/yajl_parse.h:90
      yajl_integer : access function (arg1 : System.Address; arg2 : long) return int;  -- yajl/yajl_parse.h:91
      yajl_double : access function (arg1 : System.Address; arg2 : double) return int;  -- yajl/yajl_parse.h:92
      yajl_number : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : unsigned) return int;  -- yajl/yajl_parse.h:96
      yajl_string : access function
           (arg1 : System.Address;
            arg2 : access unsigned_char;
            arg3 : unsigned) return int;  -- yajl/yajl_parse.h:101
      yajl_start_map : access function (arg1 : System.Address) return int;  -- yajl/yajl_parse.h:103
      yajl_map_key : access function
           (arg1 : System.Address;
            arg2 : access unsigned_char;
            arg3 : unsigned) return int;  -- yajl/yajl_parse.h:105
      yajl_end_map : access function (arg1 : System.Address) return int;  -- yajl/yajl_parse.h:106
      yajl_start_array : access function (arg1 : System.Address) return int;  -- yajl/yajl_parse.h:108
      yajl_end_array : access function (arg1 : System.Address) return int;  -- yajl/yajl_parse.h:109
   end record;
   pragma Convention (C_Pass_By_Copy, yajl_callbacks);  -- yajl/yajl_parse.h:110

   --  skipped anonymous struct anon_2

   type yajl_parser_config is record
      allowComments : aliased unsigned;  -- yajl/yajl_parse.h:116
      checkUTF8 : aliased unsigned;  -- yajl/yajl_parse.h:119
   end record;
   pragma Convention (C_Pass_By_Copy, yajl_parser_config);  -- yajl/yajl_parse.h:120

   --  skipped anonymous struct anon_3

   function yajl_alloc
     (callbacks : access constant yajl_callbacks;
      config : access constant yajl_parser_config;
      allocFuncs : access constant libYajl.common_h.yajl_alloc_funcs;
      ctx : System.Address) return yajl_handle;  -- yajl/yajl_parse.h:130
   pragma Import (C, yajl_alloc, "yajl_alloc");

   procedure yajl_free (handle : yajl_handle);  -- yajl/yajl_parse.h:136
   pragma Import (C, yajl_free, "yajl_free");

   function yajl_parse
     (hand : yajl_handle;
      jsonText : access unsigned_char;
      jsonTextLength : unsigned) return yajl_status;  -- yajl/yajl_parse.h:143
   pragma Import (C, yajl_parse, "yajl_parse");

   function yajl_parse_complete (hand : yajl_handle) return yajl_status;  -- yajl/yajl_parse.h:156
   pragma Import (C, yajl_parse_complete, "yajl_parse_complete");

   function yajl_get_error
     (hand : yajl_handle;
      verbose : int;
      jsonText : access unsigned_char;
      jsonTextLength : unsigned) return access unsigned_char;  -- yajl/yajl_parse.h:168
   pragma Import (C, yajl_get_error, "yajl_get_error");

   function yajl_get_bytes_consumed (hand : yajl_handle) return unsigned;  -- yajl/yajl_parse.h:184
   pragma Import (C, yajl_get_bytes_consumed, "yajl_get_bytes_consumed");

   procedure yajl_free_error (hand : yajl_handle; str : access unsigned_char);  -- yajl/yajl_parse.h:187
   pragma Import (C, yajl_free_error, "yajl_free_error");

end libYajl.parse_h;
