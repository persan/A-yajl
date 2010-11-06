with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
limited with libYajl.common_h;

package libYajl.gen_h is

   type yajl_gen_status is 
     (yajl_gen_status_ok,
      yajl_gen_keys_must_be_strings,
      yajl_max_depth_exceeded,
      yajl_gen_in_error_state,
      yajl_gen_generation_complete,
      yajl_gen_invalid_number,
      yajl_gen_no_buf);
   pragma Convention (C, yajl_gen_status);  -- yajl/yajl_gen.h:67

   --  skipped empty struct yajl_gen_t

   type yajl_gen is new System.Address;  -- yajl/yajl_gen.h:70

   type yajl_print_t is access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : unsigned);  -- yajl/yajl_gen.h:73

   type yajl_gen_config is record
      beautify : aliased unsigned;  -- yajl/yajl_gen.h:80
      indentString : Interfaces.C.Strings.chars_ptr;  -- yajl/yajl_gen.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, yajl_gen_config);  -- yajl/yajl_gen.h:85

   --  skipped anonymous struct anon_2

   function yajl_gen_alloc (config : access constant yajl_gen_config; allocFuncs : access constant libYajl.common_h.yajl_alloc_funcs) return yajl_gen;  -- yajl/yajl_gen.h:97
   pragma Import (C, yajl_gen_alloc, "yajl_gen_alloc");

   function yajl_gen_alloc2
     (callback : access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : unsigned);
      config : access constant yajl_gen_config;
      allocFuncs : access constant libYajl.common_h.yajl_alloc_funcs;
      ctx : System.Address) return yajl_gen;  -- yajl/yajl_gen.h:117
   pragma Import (C, yajl_gen_alloc2, "yajl_gen_alloc2");

   procedure yajl_gen_free (handle : yajl_gen);  -- yajl/yajl_gen.h:123
   pragma Import (C, yajl_gen_free, "yajl_gen_free");

   function yajl_gen_integer (hand : yajl_gen; number : long) return yajl_gen_status;  -- yajl/yajl_gen.h:125
   pragma Import (C, yajl_gen_integer, "yajl_gen_integer");

   function yajl_gen_double (hand : yajl_gen; number : double) return yajl_gen_status;  -- yajl/yajl_gen.h:129
   pragma Import (C, yajl_gen_double, "yajl_gen_double");

   function yajl_gen_number
     (hand : yajl_gen;
      num : Interfaces.C.Strings.chars_ptr;
      len : unsigned) return yajl_gen_status;  -- yajl/yajl_gen.h:130
   pragma Import (C, yajl_gen_number, "yajl_gen_number");

   function yajl_gen_string
     (hand : yajl_gen;
      str : access unsigned_char;
      len : unsigned) return yajl_gen_status;  -- yajl/yajl_gen.h:133
   pragma Import (C, yajl_gen_string, "yajl_gen_string");

   function yajl_gen_null (hand : yajl_gen) return yajl_gen_status;  -- yajl/yajl_gen.h:136
   pragma Import (C, yajl_gen_null, "yajl_gen_null");

   function yajl_gen_bool (hand : yajl_gen; boolean : int) return yajl_gen_status;  -- yajl/yajl_gen.h:137
   pragma Import (C, yajl_gen_bool, "yajl_gen_bool");

   function yajl_gen_map_open (hand : yajl_gen) return yajl_gen_status;  -- yajl/yajl_gen.h:138
   pragma Import (C, yajl_gen_map_open, "yajl_gen_map_open");

   function yajl_gen_map_close (hand : yajl_gen) return yajl_gen_status;  -- yajl/yajl_gen.h:139
   pragma Import (C, yajl_gen_map_close, "yajl_gen_map_close");

   function yajl_gen_array_open (hand : yajl_gen) return yajl_gen_status;  -- yajl/yajl_gen.h:140
   pragma Import (C, yajl_gen_array_open, "yajl_gen_array_open");

   function yajl_gen_array_close (hand : yajl_gen) return yajl_gen_status;  -- yajl/yajl_gen.h:141
   pragma Import (C, yajl_gen_array_close, "yajl_gen_array_close");

   function yajl_gen_get_buf
     (hand : yajl_gen;
      buf : System.Address;
      len : access unsigned) return yajl_gen_status;  -- yajl/yajl_gen.h:146
   pragma Import (C, yajl_gen_get_buf, "yajl_gen_get_buf");

   procedure yajl_gen_clear (hand : yajl_gen);  -- yajl/yajl_gen.h:153
   pragma Import (C, yajl_gen_clear, "yajl_gen_clear");

end libYajl.gen_h;
