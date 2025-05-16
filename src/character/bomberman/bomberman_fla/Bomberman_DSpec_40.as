// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_DSpec_40

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

    public dynamic class Bomberman_DSpec_40 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var character:*;
        public var dir:Boolean;
        public var bombArray:*;
        public var bomb:*;
        public var teamArray:*;
        public var combinedArray:*;
        public var teammates:*;
        public var teammate:*;
        public var tbd:*;
        public var i:int;
        public var t:int;

        public function Bomberman_DSpec_40()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 11, this.frame12);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.character = this.self;
            };
            this.bombArray = null;
            this.teamArray = null;
            this.combinedArray = null;
            this.teammates = null;
            this.teammate = null;
            this.tbd = false;
        }

        internal function frame5():*
        {
            if (this.tbd == false)
            {
                this.self.playAttackSound(1);
                this.bombArray = this.self.getGlobalVariable("bombArray");
                if (this.bombArray != null)
                {
                    this.self.playAttackSound(2);
                    this.i = 0;
                    while (this.i < this.bombArray.length)
                    {
                        this.bomb = this.bombArray[this.i];
                        if (!this.bomb.isDead())
                        {
                            this.bomb.getStanceMC().gotoAndPlay("continue");
                        }
                        else
                        {
                            this.bombArray.splice(this.i--, 1);
                        };
                        this.i++;
                    };
                };
            }
            else
            {
                if (this.tbd == true)
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
                        this.self.playAttackSound(2);
                        this.i = 0;
                        while (this.i < this.combinedArray.length)
                        {
                            this.bomb = this.combinedArray[this.i];
                            if (!this.bomb.isDead())
                            {
                                this.bomb.getStanceMC().gotoAndPlay("continue");
                            }
                            else
                            {
                                this.combinedArray.splice(this.i--, 1);
                            };
                            this.i++;
                        };
                    };
                };
            };
        }

        internal function frame6():*
        {
            this.self.setGlobalVariable("bombArray", null);
        }

        internal function frame12():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

