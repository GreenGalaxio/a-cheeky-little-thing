// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_upB_147

package sonic_fla
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

    public dynamic class sonic_upB_147 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var cancel:Number;

        public function sonic_upB_147()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 6, this.frame7, 14, this.frame15, 17, this.frame18, 28, this.frame29);
        }

        public function disableSpecials(_arg_1:*=null):void
        {
            this.self.setAttackEnabled(false, "b_forward", 999);
            this.self.setAttackEnabled(false, "b_forward_air", 999);
            this.self.setAttackEnabled(false, "b", 999);
            this.self.setAttackEnabled(false, "b_air", 999);
            this.self.setAttackEnabled(false, "b_up", 999);
            this.self.setAttackEnabled(false, "b_up_air", 999);
        }

        public function restoreSpecials(_arg_1:*=null):void
        {
            this.self.setAttackEnabled(true, "b");
            this.self.setAttackEnabled(true, "b_air");
            this.self.setAttackEnabled(true, "b_forward");
            this.self.setAttackEnabled(true, "b_forward_air");
            this.self.setAttackEnabled(true, "b_up");
            this.self.setAttackEnabled(true, "b_up_air");
            this.self.setAttackEnabled(true, "b_down");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.restoreSpecials);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_HURT, this.restoreSpecials);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_GRABBED, this.restoreSpecials);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_LEDGE_GRAB, this.restoreSpecials);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.cancel = 0;
            if (SSF2API.isReady())
            {
                this.self.fireProjectile("sonic_spring_ground_during");
                this.disableSpecials();
                this.cancel = SSF2API.random();
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.setYSpeed(-30);
        }

        internal function frame4():*
        {
            this.self.setYSpeed(-18);
        }

        internal function frame7():*
        {
            this.self.updateAttackStats({"airCancel":true});
            if (this.self.isCPU())
            {
                if (this.cancel <= 0.25)
                {
                    this.self.importCPUControls([0, 1, 1056, 1]);
                };
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.restoreSpecials, {"persistent":true});
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_HURT, this.restoreSpecials, {"persistent":true});
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_GRABBED, this.restoreSpecials, {"persistent":true});
            SSF2API.addEventListener(this.self, SSF2Event.CHAR_LEDGE_GRAB, this.restoreSpecials, {"persistent":true});
        }

        internal function frame15():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame18():*
        {
            this.self.updateAttackStats({"airCancelSpecial":true});
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

