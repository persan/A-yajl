with AUnit.Reporter.XML;
with AUnit.Run;
with Yajl.Tests.testSuits.testAll;
procedure Yajl.Tests.Test_Harnesses.Test_All is
   procedure Run is new AUnit.Run.Test_Runner (Yajl.Tests.TestSuits.TestAll.Suite);

   -- Reporter : AUnit.Reporter.Text.Text_Reporter;
   Reporter : AUnit.Reporter.XML.XML_Reporter;

begin
   Run (Reporter);
end Yajl.Tests.Test_Harnesses.Test_All;
