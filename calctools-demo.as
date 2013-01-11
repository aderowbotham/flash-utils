/*
 * CalcTools usage example
 */

import com.aderowbotham.utils.calc.CalcTools;
import com.aderowbotham.utils.calc.PositionObject;

var p1:PositionObject = new PositionObject(100,0);
var p2:PositionObject = new PositionObject(100,20);

trace("check range: "+CalcTools.getIsInRange(p1,p2,30));
//returns true because distance is 20 but the range tested was 30
