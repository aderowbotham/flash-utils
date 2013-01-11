## Preamble
This is Flash code from the a few years back. I'm archiving it here as I'm taking my old 'AdeCode' site offline. Perhaps someone will find it useful.


#### CalcTools (Aug 2008)

Here’s a calculator utility package which contains a few handy Mathematical shortcuts.

A lot of it came out of some old game code, such as <code>getIsInRange($p1,$p2,range)</code> which returns true if position1 is within the specified range of position2. $p1 and $p2 are instances of <code>PositionObject</code> which contains coordinates.

<code>PositionObject</code> supports 1, 2 or 3 dimensions, but <code>getIsInRange</code> only works with 1 or 2-dimensional PositionObjects at the moment – i.e. z-distance is ignored. Perhaps I’ll update the maths to work in 3D at some point!

###### Files
- com.aderowbotham.utils.calc.CalcTools
- com.aderowbotham.utils.calc.CalcReturnObject
- com.aderowbotham.utils.calc.PositionObject

#### SequenceRandmiser (Feb 2009)

Here’s another simple utility that came out of something old. It simply returns an array of consecutive integers, only in a random order, with no reptition. By default the smallest value is zero and the highest is the length of array requested – 1. However you can set the base value via an optional second argument.

A typical usage would be to trigger a number of animations in a random order.

Again, simple stuff but if it saves you 10 minutes then this post was worthwhile.

###### Files
- com.aderowbotham.utils.SequenceRandomiser

###### Demo
<pre>
import com.aderowbotham.utils.SequenceRandomiser;

//create a sequence of length 10
var mySequence:Array = SequenceRandomiser.createSequence(10);
trace(mySequence);    //e.g. 5,0,7,8,2,4,1,9,6,3

//create a sequence of length 10, from -5
mySequence = SequenceRandomiser.createSequence(10,-5);
trace(mySequence);    //e.g. -4,-5,0,-3,2,1,3,-2,4,-1
</pre>



#### Leap year detection (Sept 2009)

A year will be a leap year if it is divisible by 4 but not by 100. If a year is divisible by 4 and by 100, it is not a leap year unless it is also divisible by 400.

In Actionscript 3.0 that looks like this:

<pre><code>
function getIsLeapyear(year:int):Boolean{
	var result:Boolean = false;
	var divBy4:Boolean = (year % 4 == 0);
	var divBy100:Boolean = (year % 100 == 0);
	var divBy400:Boolean =  (year % 400 == 0);
	if(divBy4){
		if(divBy100){
			if(divBy400){
				result = true;
			} else {
				result = false;
			}
		} else {
			result = true;
		}
	} else {
		result = false;
	}
	return result;
}
</code></pre>


#### StageAwareSprite (Jan 2010)

Here’s another handy little object. Again, it’s pretty trivial but might save you 10 minutes.

Extend StageAwareSprite instead of Sprite to get automatic handing of any stage-related activity. This simply saves you all the hassle of adding and removing the event listeners yourself.

The class has protected addedToStage, removedFromStage and stageResize methods that are triggered as you expect but which do nothing by default. They are intended to be extended so you can create your own custom behaviours.

###### Files
- com.aderowbotham.utils.StageAwareSprite
- stage-aware-sprite-demo.as
