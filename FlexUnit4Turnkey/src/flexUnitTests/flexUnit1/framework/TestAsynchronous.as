package flexUnitTests.flexUnit1.framework{   import flash.events.Event;   import flash.events.TimerEvent;   import flash.utils.Timer;      import flexunit.framework.Assert;   import flexunit.framework.TestCase;   import flexunit.framework.TestResult;   public class TestAsynchronous extends TestCase   {       public function TestAsynchronous(name : String = null)       {           super(name);       }          public function testInTimePass() : void       {           var test : TestCase = new AsynchronousTestCase("testInTimePass");           var result : TestResult = test.run();           initAsync(result, 1, 0, 0);       }          public function testInTimeFail() : void       {           var test : TestCase = new AsynchronousTestCase("testInTimeFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          //this test won't be run right now because the Error that is thrown propagates up and creates a dialog       //and if the dialog isn't closed in time it screws up the timer in here.  however if you run it manaully and close       //the dialog in time it should be ok       public function STOPtestInTimeError() : void       {           var test : TestCase = new AsynchronousTestCase("testInTimeError");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testTooLatePass() : void       {           var test : TestCase = new AsynchronousTestCase("testTooLatePass");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testTooLateFail() : void       {           var test : TestCase = new AsynchronousTestCase("testTooLateFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          //this test won't be run right now because the Error that is thrown propagates up and creates a dialog       //and if the dialog isn't closed in time it screws up the timer in here.  however if you run it manaully and close       //the dialog in time it should be ok       public function STOPtestTooLateError() : void       {           var test : TestCase = new AsynchronousTestCase("testTooLateError");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testSecondInTimePass() : void       {           var test : TestCase = new AsynchronousTestCase("testSecondInTimePass");           var result : TestResult = test.run();           initAsync(result, 1, 0, 0);       }          public function testSecondInTimeFail() : void       {           var test : TestCase = new AsynchronousTestCase("testSecondInTimeFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testSecondTooLatePass() : void       {           var test : TestCase = new AsynchronousTestCase("testSecondTooLatePass");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testSecondTooLateFail() : void       {           var test : TestCase = new AsynchronousTestCase("testSecondTooLateFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testTimeoutFunctionPass() : void       {           var test : TestCase = new AsynchronousTestCase("testTimeoutFunctionPass");           var result : TestResult = test.run();           initAsync(result, 1, 0, 0);       }          public function testTimeoutFunctionFail() : void       {           var test : TestCase = new AsynchronousTestCase("testTimeoutFunctionFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function testNotReallyAsynchronousPass() : void       {           var test : TestCase = new AsynchronousTestCase("testNotReallyAsynchronousPass");           var result : TestResult = test.run();           initAsync(result, 1, 0, 0);       }          public function testNotReallyAsynchronousFail() : void       {           var test : TestCase = new AsynchronousTestCase("testNotReallyAsynchronousFail");           var result : TestResult = test.run();           initAsync(result, 1, 1, 0);       }          public function shouldBeRun(event : Event, passedData : Object) : void       {           var result : TestResult = passedData.result;           var expectedRun : int = passedData.expectedRun;           var expectedFail : int = passedData.expectedFail;           var expectedError : int = passedData.expectedError;              Assert.assertEquals("result.runCount() is not correct", expectedRun, result.runCount());           Assert.assertEquals("result.failureCount() is not correct",expectedFail, result.failureCount());           Assert.assertEquals("result.errorCount() is not correct", expectedError, result.errorCount());       }          private function initAsync(result : TestResult, expectedRun : int, expectedFail : int, expectedError : int):void       {           var data : Object = new Object();           data.result = result;           data.expectedRun = expectedRun;           data.expectedFail = expectedFail;           data.expectedError = expectedError;           var t : Timer = new Timer(1000, 1);           var helper : Function = addAsync(shouldBeRun, 1500, data, function():void { fail('shouldBeRun did not fire')} );           t.addEventListener( TimerEvent.TIMER, helper );           t.start();       }   }}