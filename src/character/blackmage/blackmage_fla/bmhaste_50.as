// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmhaste_50

package blackmage_fla
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

    public dynamic class bmhaste_50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var ground:Boolean;

        public function bmhaste_50()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 30, this.frame31, 42, this.frame43, 43, this.frame44, 44, this.frame45, 46, this.frame47, 48, this.frame49, 50, this.frame51, 52, this.frame53, 54, this.frame55, 56, this.frame57, 58, this.frame59, 61, this.frame62, 62, this.frame63, 65, this.frame66, 66, this.frame67, 70, this.frame71, 72, this.frame73, 76, this.frame77, 77, this.frame78, 80, this.frame81, 81, this.frame82, 84, this.frame85, 86, this.frame87, 87, this.frame88, 88, this.frame89, 89, this.frame90, 91, this.frame92, 103, this.frame104);
        }

        public function checkGrabbed():*
        {
            if (this.self.getGrabbedOpponent())
            {
                this.self.gotoGrabbedCharacter();
                SSF2API.destroyTimer(this.self, this.checkGrabbed);
                SSF2API.removeEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                gotoAndPlay("continue");
            };
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.createTimer(this.self, 1, 0, this.checkGrabbed);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.continuePlaying = false;
                this.ground = this.self.isOnGround();
                if (!this.ground)
                {
                    this.self.setXSpeed(0);
                };
                SSF2API.playSound("haste1");
                this.self.setGlobalVariable("Boost", 0);
            };
        }

        internal function frame19():*
        {
            SSF2API.destroyTimer(this.self, this.checkGrabbed);
        }

        internal function frame31():*
        {
            if (!this.self.isOnGround())
            {
                this.self.endAttack();
            };
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }

        internal function frame44():*
        {
            SSF2API.playSound("haste2");
        }

        internal function frame45():*
        {
            if (!this.self.isOnGround())
            {
                this.self.setXSpeed(0);
            };
        }

        internal function frame47():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame49():*
        {
            this.self.refreshAttackID();
        }

        internal function frame51():*
        {
            SSF2API.playSound("bm_sw_s");
        }

        internal function frame53():*
        {
            this.self.refreshAttackID();
        }

        internal function frame55():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame57():*
        {
            this.self.refreshAttackID();
        }

        internal function frame59():*
        {
            SSF2API.playSound("bm_sw_s");
        }

        internal function frame62():*
        {
            this.self.refreshAttackID();
        }

        internal function frame63():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame66():*
        {
            this.self.refreshAttackID();
        }

        internal function frame67():*
        {
            SSF2API.playSound("bm_sw_s");
        }

        internal function frame71():*
        {
            this.self.refreshAttackID();
        }

        internal function frame73():*
        {
            SSF2API.playSound("bm_sw_m");
            this.self.updateAttackBoxStats(1, {"damage":2});
        }

        internal function frame77():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame78():*
        {
            this.self.refreshAttackID();
        }

        internal function frame81():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame82():*
        {
            this.self.refreshAttackID();
        }

        internal function frame85():*
        {
            SSF2API.playSound("bm_sw_m");
        }

        internal function frame87():*
        {
            this.self.refreshAttackID();
        }

        internal function frame88():*
        {
            this.self.updateAttackBoxStats(1, {"damage":4});
            this.self.refreshAttackID();
            this.self.updateAttackStats({
                "canFallOff":true,
                "xSpeedDecayAir":-0.15
            });
        }

        internal function frame89():*
        {
            SSF2API.playSound("bm_sw_l");
            this.self.updateAttackBoxStats(1, {
                "selfHitStun":2,
                "damage":6,
                "hasEffect":true
            });
        }

        internal function frame90():*
        {
            this.self.releaseOpponent();
            this.self.setXSpeed(17.5, false);
        }

        internal function frame92():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame104():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

