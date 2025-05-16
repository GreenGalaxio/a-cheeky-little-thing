// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_sspec_air_47

package link_fla
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

    public dynamic class link_new_sspec_air_47 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var sSpecStored:String;
        public var sSpecLabel:String;
        public var fromProjectile:*;
        public var upDir:*;
        public var downDir:*;
        public var fired:*;

        public function link_new_sspec_air_47()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.sSpecStored = null;
            this.sSpecLabel = null;
            this.fromProjectile = false;
            this.upDir = 15;
            this.downDir = (360 - this.upDir);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.sSpecStored = this.self.getGlobalVariable("sStoredLabel");
                if (((!(this.sSpecStored == "Frame1")) && (!(this.sSpecStored == null))))
                {
                    gotoAndPlay(this.sSpecStored);
                }
                else
                {
                    this.self.setGlobalVariable("sStoredLabel", "Frame1");
                };
            };
        }

        internal function frame2():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame2");
        }

        internal function frame3():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame3");
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame4");
        }

        internal function frame5():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame5");
        }

        internal function frame6():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame6");
            this.self.playVoiceSound(1);
        }

        internal function frame7():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame7");
        }

        internal function frame8():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame8");
        }

        internal function frame9():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame9");
        }

        internal function frame10():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame10");
        }

        internal function frame11():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame11");
        }

        internal function frame12():*
        {
            this.fired = true;
            this.sSpecStored = this.self.getGlobalVariable("sStoredLabel");
            if (this.sSpecStored != "boom_throw")
            {
                this.self.setGlobalVariable("sStoredLabel", "boom_throw");
                this.fired = this.self.fireProjectile("sSpecBoomerang");
                if (this.fired)
                {
                    this.self.playAttackSound(1);
                    if (this.self.isFacingRight())
                    {
                        if (this.self.getControls().UP)
                        {
                            this.self.getCurrentProjectile().angleControl(this.self.getCurrentProjectile().getProjectileStat("xspeed"), this.upDir);
                        }
                        else
                        {
                            if (this.self.getControls().DOWN)
                            {
                                this.self.getCurrentProjectile().angleControl(this.self.getCurrentProjectile().getProjectileStat("xspeed"), this.downDir);
                            };
                        };
                    }
                    else
                    {
                        if (!this.self.isFacingRight())
                        {
                            if (this.self.getControls().UP)
                            {
                                this.self.getCurrentProjectile().angleControl(this.self.getCurrentProjectile().getProjectileStat("xspeed"), (180 - this.upDir));
                            }
                            else
                            {
                                if (this.self.getControls().DOWN)
                                {
                                    this.self.getCurrentProjectile().angleControl(this.self.getCurrentProjectile().getProjectileStat("xspeed"), (180 - this.downDir));
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame13");
        }

        internal function frame14():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame14");
        }

        internal function frame15():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame15");
        }

        internal function frame16():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame16");
        }

        internal function frame17():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame17");
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            if (this.fromProjectile)
            {
                this.self.updateAttackStats({"allowFullInterrupt":true});
            };
        }

        internal function frame18():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame18");
        }

        internal function frame19():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame19");
        }

        internal function frame20():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame20");
        }

        internal function frame21():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame21");
        }

        internal function frame22():*
        {
            this.self.setGlobalVariable("sStoredLabel", "Frame22");
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

