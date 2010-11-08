with yajl.tests.testcases.basic;
package body yajl.tests.testSuits.testAll is
   use AUnit.Test_Suites;

   Test_1 : aliased Yajl.Tests.Testcases.Basic.Test_Case;
   -- Statically allocate test suite:
   Result : aliased Test_Suite;


   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_1'Access);
      return Result'Access;
   end Suite;

end yajl.tests.testSuits.testAll;
