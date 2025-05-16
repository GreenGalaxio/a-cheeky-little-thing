// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_sspecAir_92

package captainfalcon_fla
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

    public dynamic class falcon_sspecAir_92 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hasHit:*;
        public var self:*;

        public function falcon_sspecAir_92()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 19, this.frame20, 21, this.frame22, 22, this.frame23, 24, this.frame25, 33, this.frame34);
        }

        public function toFrame(_arg_1:*):*
        {
            this.gotoAndPlay("afterHit");
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toFrame);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toFrame);
        }

        internal function frame1():*
        {
            this.hasHit = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.self.playAttackSound(1);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toFrame);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toFrame);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame8():*
        {
            this.self.setXSpeed(17.2, false);
            this.self.playAttackSound(2);
        }

        internal function frame20():*
        {
            this.self.setXSpeed(4, false);
            this.self.updateAttackStats({
                "xSpeedDecayAir":-0.3,
                "air_ease":-1
            });
        }

        internal function frame22():*
        {
            this.self.resetMovement();
            this.self.endAttack();
        }

        internal function frame23():*
        {
            this.hasHit = true;
            this.self.updateAttackStats({"canFallOff":false});
            this.self.updateAttackBoxStats(1, {
                "allowTurboInterrupt":true,
                "damage":7,
                "direction":270,
                "power":60,
                "kbConstant":70,
                "hitStun":4,
                "selfHitStun":4,
                "hasEffect":true,
                "effect_id":"effect_firehit1",
                "effectSound":"brawl_punch_m",
                "bypassShield":false,
                "priority":4
            });
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.setYSpeed(-9);
            this.self.setXSpeed(8.6, false);
            this.self.updateAttackStats({"xSpeedDecayAir":-0.1});
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

