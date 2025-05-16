// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_specialD_67

package fox_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class fox_specialD_67 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var level:int;
        public var hasHit:*;
        public var xframe:*;
        public var chance:*;
        public var randnum:*;

        public function fox_specialD_67()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 9, this.frame10, 10, this.frame11, 13, this.frame14, 14, this.frame15, 25, this.frame26, 26, this.frame27);
        }

        public function gotoHitShield(_arg_1:*=null):void
        {
            this.gotoAndPlay("afterHit");
        }

        public function gotoReflect(_arg_1:*=null):void
        {
            this.self.setIntangibility(true);
            this.gotoAndPlay("reflect");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.level = 0;
            this.hasHit = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.xframe = null;
                this.self.setIntangibility(true);
                SSF2API.addEventListener(this.self, SSF2Event.REVERSE, this.gotoReflect);
                this.self.attachEffect("fox_shineEffect");
                this.self.playAttackSound(1);
                if (this.self.isCPU())
                {
                    this.level = this.self.getCPULevel();
                    SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.gotoHitShield);
                };
            };
        }

        internal function frame2():*
        {
            this.chance = 0;
            if (this.self.isCPU())
            {
                this.chance = SSF2API.random();
                if (((this.level >= 7) && (this.chance <= (0.4 + (0.2 * (this.level - 7))))))
                {
                    if (!this.self.isFacingRight())
                    {
                        this.self.importCPUControls([0, 1, 640, 1]);
                    }
                    else
                    {
                        this.self.importCPUControls([0, 1, 384, 1]);
                    };
                };
            };
            this.self.setIntangibility(false);
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame11():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame14():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame15():*
        {
            this.xframe = "attack";
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame27():*
        {
            this.randnum = 0;
            if (this.self.isCPU())
            {
                this.randnum = SSF2API.random();
                if (this.randnum <= 0.5)
                {
                    this.self.importCPUControls([128, 2, 4113, 1]);
                }
                else
                {
                    if (this.randnum <= 0.55)
                    {
                        this.self.importCPUControls([128, 3, 5185, 2, 128, 1, 4113, 1]);
                    }
                    else
                    {
                        if (this.randnum <= 0.6)
                        {
                            this.self.importCPUControls([128, 3, 5185, 2, 128, 2, 5185, 2, 128, 1, 4113, 1]);
                        }
                        else
                        {
                            if (this.randnum <= 0.7)
                            {
                                this.self.importCPUControls([128, 3, 4097, 1, 4129, 2]);
                            }
                            else
                            {
                                if (this.randnum <= 0.8)
                                {
                                    this.self.importCPUControls([128, 3, 5185, 2, 128, 1, 4097, 1, 4129, 2]);
                                }
                                else
                                {
                                    if (this.randnum <= 0.95)
                                    {
                                        this.self.importCPUControls([128, 2, 4097, 1, 5153, 1]);
                                    }
                                    else
                                    {
                                        this.self.importCPUControls([128, 3, 5185, 2, 128, 1, 4097, 1, 5153, 1]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            stop();
            this.self.endAttack();
        }


    }
}//package fox_fla

