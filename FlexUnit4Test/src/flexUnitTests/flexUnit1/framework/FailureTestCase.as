package flexUnitTests.flexUnit1.framework{   import flexunit.framework.*;      public class FailureTestCase extends TestCase   {       public function FailureTestCase(name : String):void       {           super(name);       }          public function testFailure():void       {           fail("intentional failure");       }   }}