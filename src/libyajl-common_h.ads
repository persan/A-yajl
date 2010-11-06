with Interfaces.C; use Interfaces.C;
with System;

package libYajl.common_h is

   YAJL_MAX_DEPTH : constant := 128;  --  yajl/yajl_common.h:40
   --  unsupported macro: YAJL_API __attribute__ ((visibility("default")))

   type yajl_malloc_func is access function (arg1 : System.Address; arg2 : unsigned) return System.Address;  -- yajl/yajl_common.h:61

   type yajl_free_func is access procedure (arg1 : System.Address; arg2 : System.Address);  -- yajl/yajl_common.h:65

   type yajl_realloc_func is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : unsigned) return System.Address;  -- yajl/yajl_common.h:68

   type yajl_alloc_funcs is record
      malloc : access function (arg1 : System.Address; arg2 : unsigned) return System.Address;  -- yajl/yajl_common.h:75
      realloc : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : unsigned) return System.Address;  -- yajl/yajl_common.h:77
      free : access procedure (arg1 : System.Address; arg2 : System.Address);  -- yajl/yajl_common.h:80
      ctx : System.Address;  -- yajl/yajl_common.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, yajl_alloc_funcs);  -- yajl/yajl_common.h:83

   --  skipped anonymous struct anon_0

end libYajl.common_h;
