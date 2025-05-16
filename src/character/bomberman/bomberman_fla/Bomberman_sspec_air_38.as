// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_sspec_air_38

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class Bomberman_sspec_air_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var reverseBox:MovieClip;
        public var self:*;
        public var character:*;
        public var controls:*;
        public var dir:Boolean;
        public var bombArray:*;
        public var bomb:*;
        public var teamArray:*;
        public var combinedArray:*;
        public var teammates:*;
        public var teammate:*;
        public var t:int;
        public var i:int;
        public var xPosN:*;
        public var yPosN:*;

        public function Bomberman_sspec_air_38()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 8, this.frame9, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.character = this.self;
                this.controls = this.character.getControls();
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            };
            this.bombArray = null;
            this.teamArray = null;
            this.combinedArray = null;
            this.teammates = null;
            this.teammate = null;
        }

        internal function frame5():*
        {
            this.bombArray = this.self.getGlobalVariable("bombArray");
            this.self.playAttackSound(1);
            this.teammates = this.self.getTeammates();
            if (this.teammates != null)
            {
                this.t = 0;
                while (this.t < this.teammates.length)
                {
                    if (this.teammates[this.t].getLinkageID() == "bomberman")
                    {
                        SSF2API.print((("teammate number" + (this.t + 1)) + " is bomberman!"));
                        if (this.teamArray == null)
                        {
                            this.teamArray = this.teammates[this.t].getGlobalVariable("bombArray");
                        }
                        else
                        {
                            if (this.teammates[this.t].getGlobalVariable("bombArray") != null)
                            {
                                this.teamArray = this.teamArray.concat(this.teammates[this.t].getGlobalVariable("bombArray"));
                            };
                        };
                    };
                    this.t++;
                };
            };
            if (this.teamArray != null)
            {
                if (this.bombArray != null)
                {
                    this.combinedArray = this.bombArray.concat(this.teamArray);
                }
                else
                {
                    this.combinedArray = this.teamArray;
                };
                SSF2API.print("Added the teammate(s) bombs to yours.");
            }
            else
            {
                this.combinedArray = this.bombArray;
                SSF2API.print("The teammate(s) had no bombs.");
            };
            if (this.combinedArray != null)
            {
                this.i = 0;
                while (this.i < this.combinedArray.length)
                {
                    this.bomb = this.combinedArray[this.i];
                    this.xPosN = (this.bomb.getX() - this.self.getX());
                    this.yPosN = Math.abs((this.bomb.getY() - this.self.getY()));
                    this.dir = this.self.isFacingRight();
                    if (this.dir)
                    {
                        if ((((this.xPosN > -20) && (this.xPosN < 50)) && (this.yPosN < 60)))
                        {
                            if (((!(this.bomb.isDead())) && (this.bomb)))
                            {
                                SSF2API.print("bomb found! kicking...");
                                this.bomb.getStanceMC().airKick = true;
                                this.self.forceHitStun(2, 0);
                                this.bomb.forceHitStun(2, 0);
                                SSF2API.playSound("bandanadee_jump");
                                this.bomb.getStanceMC().gotoAndPlay("kickedRight");
                            }
                            else
                            {
                                this.combinedArray.splice(this.i--, 1);
                            };
                        };
                    }
                    else
                    {
                        if ((((this.xPosN > -50) && (this.xPosN < 20)) && (this.yPosN < 50)))
                        {
                            if (((!(this.bomb.isDead())) && (this.bomb)))
                            {
                                SSF2API.print("bomb found! kicking...");
                                this.bomb.getStanceMC().airKick = true;
                                this.self.forceHitStun(2, 0);
                                this.bomb.forceHitStun(2, 0);
                                SSF2API.playSound("bandanadee_jump");
                                this.bomb.getStanceMC().gotoAndPlay("kickedLeft");
                            }
                            else
                            {
                                this.combinedArray.splice(this.i--, 1);
                            };
                        };
                    };
                    this.i++;
                };
            };
        }

        internal function frame7():*
        {
            this.self.setYSpeed(-5);
        }

        internal function frame9():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame14():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame15():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame16():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame17():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame18():*
        {
            this.self.endAttack();
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame19():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame20():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame21():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame22():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame23():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame24():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

