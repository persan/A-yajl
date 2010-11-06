with Interfaces.C; use Interfaces.C;

package libYajl.version_h is


   YAJL_MAJOR : constant := 1;  --  yajl/yajl_version.h:6
   YAJL_MINOR : constant := 0;  --  yajl/yajl_version.h:7
   YAJL_MICRO : constant := 11;  --  yajl/yajl_version.h:8
   --  unsupported macro: YAJL_VERSION ((YAJL_MAJOR * 10000) + (YAJL_MINOR * 100) + YAJL_MICRO)

   function yajl_version return int;  -- yajl/yajl_version.h:16
   pragma Import (C, yajl_version, "yajl_version");

end libYajl.version_h;
