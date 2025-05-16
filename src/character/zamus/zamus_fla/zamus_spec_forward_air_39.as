// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_spec_forward_air_39

package zamus_fla
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

    public dynamic class zamus_spec_forward_air_39 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hand:MovieClip;
        public var hand2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var sspecLocal:*;
        public var controls:*;

        public function zamus_spec_forward_air_39()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 10, this.frame11, 14, this.frame15, 20, this.frame21);
        }

        public function switchFramesAir():void
        {
            if (this.self.isOnGround())
            {
                this.self.setGlobalVariable("sspecSwitch", this.currentFrame);
                this.self.forceAttack("b_forward");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.createTimer(this.self, 1, 0, this.switchFramesAir);
                this.sspecLocal = this.self.getGlobalVariable("sspecSwitch");
                if (this.sspecLocal != null)
                {
                    this.self.setGlobalVariable("sspecSwitch", null);
                    gotoAndPlay(this.sspecLocal);
                };
                this.self.setGlobalVariable("tether", false);
            };
        }

        internal function frame9():*
        {
            this.self.setGlobalVariable("tether", true);
            this.self.setGlobalVariable("lastTether", "forwardB");
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            SSF2API.playSound("zamus_tryme", true);
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.self.updateAttackBoxStats(1, {
                    "shock":false,
                    "burn":true,
                    "damage":10,
                    "direction":120,
                    "kbConstant":40,
                    "power":60,
                    "burn":true,
                    "hitStun":5,
                    "selfHitStun":4,
                    "effectSound":"brawl_fire_s"
                });
            }
            else
            {
                this.self.updateAttackBoxStats(1, {
                    "shock":false,
                    "burn":true,
                    "damage":10,
                    "direction":40,
                    "kbConstant":70,
                    "power":60,
                    "burn":true,
                    "hitStun":5,
                    "selfHitStun":4,
                    "effectSound":"brawl_fire_s"
                });
            };
            this.self.refreshAttackID();
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

