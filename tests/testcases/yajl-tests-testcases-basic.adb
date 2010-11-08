with GNAT.Source_Info;
package body Yajl.Tests.Testcases.Basic is
   use AUnit;

   -- Fixture elements


   ----------
   -- Name --
   ----------

   function Name (T : Test_Case)
                  return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return Format (GNAT.Source_Info.File & ":(no description)");
   end Name;


   -------------------------
   --  SampleTest
   -------------------------
   procedure SampleTest (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      T : Test_Case renames Test_Case (Test);
   begin
      T.Assert (False, "TODO Implement Test");
   end SampleTest;

   --------------------
   -- Register_Tests --
   --------------------

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases.Registration;

   begin
      Register_Routine  (T, SampleTest'Access, "SampleTest");
   end Register_Tests;

end Yajl.Tests.Testcases.Basic;
