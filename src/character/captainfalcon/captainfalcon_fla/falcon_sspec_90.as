// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_sspec_90

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

    public dynamic class falcon_sspec_90 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hasHit:*;
        public var self:*;
        public var grounded:Boolean;

        public function falcon_sspec_90()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 19, this.frame20, 28, this.frame29, 30, this.frame31, 31, this.frame32, 32, this.frame33, 44, this.frame45);
        }

        public function toFrame(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toFrame);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toFrame);
            this.gotoAndPlay("afterHit");
        }

        public function checkGround():*
        {
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                this.self.resetMovement();
                this.self.endAttack();
            };
        }

        internal function frame1():*
        {
            this.hasHit = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.grounded = this.self.isOnGround();
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toFrame);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.toFrame);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, function ():*
                {
                    if (!self.isOnGround())
                    {
                        self.toHelpless();
                    };
                });
            };
        }

        internal function frame8():*
        {
            this.self.playAttackSound(2);
            this.self.setXSpeed(17.2, false);
            SSF2API.createTimer(this.self, 2, 7, this.checkGround);
        }

        internal function frame20():*
        {
            this.self.resetMovement();
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"canFallOff":false});
        }

        internal function frame29():*
        {
            this.self.resetMovement();
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }

        internal function frame32():*
        {
            this.hasHit = true;
            this.self.updateAttackBoxStats(1, {
                "allowTurboInterrupt":true,
                "damage":7,
                "direction":90,
                "power":78,
                "kbConstant":65,
                "hitStun":1,
                "selfHitStun":0,
                "hasEffect":true,
                "effect_id":"effect_firehit1",
                "effectSound":"brawl_punch_m",
                "bypassShield":false,
                "priority":4
            });
            this.self.updateAttackStats({"canFallOff":false});
            this.self.refreshAttackID();
        }

        internal function frame33():*
        {
            this.self.resetMovement();
            this.self.setXSpeed(0);
            this.checkGround();
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

