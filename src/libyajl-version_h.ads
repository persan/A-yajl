with Interfaces.C; use Interfaces.C;

package libYajl.version_h is

   MAJOR : constant := 1;  --  yajl/yajl_version.h:6
   MINOR : constant := 0;  --  yajl/yajl_version.h:7
   MICRO : constant := 11;  --  yajl/yajl_version.h:8
   VERSION  : constant := ((MAJOR * 10000) + (MINOR * 100) + MICRO);

   function yajl_version return int;  -- yajl/yajl_version.h:16
   pragma Import (C, yajl_version, "yajl_version");

end libYajl.version_h;
