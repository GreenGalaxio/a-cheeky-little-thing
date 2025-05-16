// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_SSpec2_36

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class Bomberman_SSpec2_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
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

        public function Bomberman_SSpec2_36()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.character = this.self;
                this.controls = this.character.getControls();
            };
            this.bombArray = null;
            this.teamArray = null;
            this.combinedArray = null;
            this.teammates = null;
            this.teammate = null;
        }

        internal function frame2():*
        {
            this.bombArray = this.self.getGlobalVariable("bombArray");
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
                            if ((((!(this.teammates[this.t].getGlobalVariable("bombArray") == null)) && (!(this.teammates == null))) && (!(this.teammates[this.t].getGlobalVariable("bombArray") == null))))
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
                        if ((((this.xPosN > -10) && (this.xPosN < 55)) && (this.yPosN < 50)))
                        {
                            if (((!(this.bomb.isDead())) && (this.bomb)))
                            {
                                SSF2API.print("bomb found! kicking...");
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
                        if ((((this.xPosN > -55) && (this.xPosN < 10)) && (this.yPosN < 50)))
                        {
                            if (((!(this.bomb.isDead())) && (this.bomb)))
                            {
                                SSF2API.print("bomb found! kicking...");
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

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame7():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame8():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame9():*
        {
            this.controls = this.character.getControls();
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.character.forceAttack("b_down");
            };
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

