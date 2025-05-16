// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaBeat_gif_53

package megaman_fla
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

    public dynamic class MegaBeat_gif_53 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var grounded:Boolean;
        public var finish:int;
        public var bullet:Number;
        public var cancel:Number;

        public function MegaBeat_gif_53()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 17, this.frame18, 21, this.frame22, 27, this.frame28, 28, this.frame29, 33, this.frame34, 34, this.frame35, 37, this.frame38);
        }

        public function rise():*
        {
            this.self.setYSpeed(-8);
        }

        public function reenable(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_GRABBED, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_KO_DEATH, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_LEDGE_GRAB, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_SELF_DESTRUCT, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.reenable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.disable);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.disable);
            this.self.setAttackEnabled(true, "b_up");
            this.self.setAttackEnabled(true, "b_up_air");
        }

        public function jumpToEnd():*
        {
            if (this.finish >= 30)
            {
                SSF2API.destroyTimer(this.self, this.jumpToEnd);
                this.gotoAndPlay("end");
            };
            this.finish++;
        }

        public function disable(_arg_1:*=null):void
        {
            if (!this.self.isOnGround())
            {
                this.self.setAttackEnabled(false, "b_up");
                this.self.setAttackEnabled(false, "b_up_air");
            };
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.reenable, {"persistent":true});
        }

        public function reenableOnHit(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.reenableOnHit);
            this.self.setAttackEnabled(true, "b_up");
            this.self.setAttackEnabled(true, "b_up_air");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.grounded = false;
            this.finish = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.grounded = this.self.isOnGround();
                SSF2API.createTimer(this.self, 1, 30, this.rise);
                SSF2API.createTimer(this.self, 1, -1, this.jumpToEnd);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_GRABBED, this.reenable, {"persistent":true});
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_KO_DEATH, this.reenable, {"persistent":true});
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.disable);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.disable);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_LEDGE_GRAB, this.reenable, {"persistent":true});
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_SELF_DESTRUCT, this.reenable, {"persistent":true});
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.reenable, {"persistent":true});
            };
        }

        internal function frame8():*
        {
            this.self.updateAttackStats({"secondaryAttack":"attack"});
        }

        internal function frame9():*
        {
            this.bullet = -1;
            this.cancel = -1;
            if (this.self.isCPU())
            {
                if (this.grounded)
                {
                    this.cancel = SSF2API.random();
                    if (this.cancel <= 0.5)
                    {
                        if (this.self.isFacingRight())
                        {
                            this.self.importCPUControls([0, 1, 288, 1]);
                        }
                        else
                        {
                            this.self.importCPUControls([0, 1, 544, 1]);
                        };
                    }
                    else
                    {
                        if (this.cancel <= 0.75)
                        {
                            this.self.importCPUControls([0, 1, 32, 1]);
                        }
                        else
                        {
                            this.self.importCPUControls([0, 1, 2080, 1]);
                        };
                    };
                };
                this.bullet = SSF2API.random();
                if (this.bullet <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 64, 1]);
                };
                this.bullet = SSF2API.random();
            };
        }

        internal function frame11():*
        {
            if (this.self.isCPU())
            {
                if (this.bullet <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 64, 1]);
                };
                this.bullet = SSF2API.random();
            };
        }

        internal function frame13():*
        {
            if (this.self.isCPU())
            {
                if (!((this.self.inLowerLeftWarningBounds()) && (this.self.inLowerRightWarningBounds())))
                {
                    this.cancel = SSF2API.random();
                    if (this.cancel <= 0.15)
                    {
                        if (this.self.isFacingRight())
                        {
                            this.self.importCPUControls([0, 4, 288, 1]);
                        }
                        else
                        {
                            this.self.importCPUControls([0, 4, 544, 1]);
                        };
                    }
                    else
                    {
                        if (this.cancel <= 0.25)
                        {
                            this.self.importCPUControls([0, 4, 32, 1]);
                        }
                        else
                        {
                            if (this.cancel <= 0.55)
                            {
                                this.self.importCPUControls([0, 4, 1056, 1]);
                            };
                        };
                    };
                };
                this.cancel = SSF2API.random();
                if (this.bullet <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 64, 1]);
                };
                this.bullet = SSF2API.random();
            };
        }

        internal function frame15():*
        {
            if (this.self.isCPU())
            {
                if (this.bullet <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 64, 1]);
                };
                this.bullet = SSF2API.random();
            };
        }

        internal function frame17():*
        {
            if (this.self.isCPU())
            {
                if (!((this.self.inLowerLeftWarningBounds()) && (this.self.inLowerRightWarningBounds())))
                {
                    if (this.cancel <= 0.15)
                    {
                        if (this.self.isFacingRight())
                        {
                            this.self.importCPUControls([0, 4, 288, 1]);
                        }
                        else
                        {
                            this.self.importCPUControls([0, 4, 544, 1]);
                        };
                    }
                    else
                    {
                        if (this.cancel <= 0.2)
                        {
                            this.self.importCPUControls([0, 4, 32, 1]);
                        }
                        else
                        {
                            if (this.cancel <= 0.55)
                            {
                                this.self.importCPUControls([0, 4, 1056, 1]);
                            };
                        };
                    };
                };
                if (this.bullet <= 0.4)
                {
                    this.self.importCPUControls([0, 1, 64, 1]);
                };
                this.bullet = SSF2API.random();
            };
        }

        internal function frame18():*
        {
            gotoAndPlay("redo");
        }

        internal function frame22():*
        {
            this.self.fireProjectile("megaman_buster1", 6, -17);
            this.self.playAttackSound(2);
        }

        internal function frame28():*
        {
            gotoAndPlay("redo");
        }

        internal function frame29():*
        {
            this.self.updateAttackStats({"secondaryAttack":null});
            this.self.setAttackEnabled(false, "b_up");
            this.self.setAttackEnabled(false, "b_up_air");
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.reenableOnHit, {"persistent":true});
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            this.self.updateAttackStats({"secondaryAttack":null});
            this.self.setAttackEnabled(false, "b_up");
            this.self.setAttackEnabled(false, "b_up_air");
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

