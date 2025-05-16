// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_dspec_air_110

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

    public dynamic class falcon_dspec_air_110 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hasHit:*;
        public var self:*;

        public function falcon_dspec_air_110()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 5, this.frame6, 8, this.frame9, 10, this.frame11, 14, this.frame15, 22, this.frame23, 24, this.frame25, 25, this.frame26, 40, this.frame41, 41, this.frame42, 44, this.frame45, 59, this.frame60);
        }

        public function toFrame(_arg_1:*):*
        {
            gotoAndPlay("continue");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
        }

        public function physics():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(18);
        }

        public function crash(_arg_1:*):*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(18);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.crash);
        }

        internal function frame1():*
        {
            this.hasHit = false;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.resetMovement);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.crash);
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame3():*
        {
            this.self.setYSpeed(-8);
        }

        internal function frame6():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame9():*
        {
            SSF2API.createTimer(this.self, 1, 9, this.physics);
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":13,
                "kbConstant":65
            });
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":11,
                "kbConstant":60
            });
        }

        internal function frame23():*
        {
            this.self.updateAttackStats({"air_ease":3});
            this.self.resetJumps();
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.self.playAttackSound(2);
            this.self.resetMovement();
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"canFallOff":false});
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }

        internal function frame42():*
        {
            this.hasHit = true;
            this.self.resetMovement();
            this.self.setXSpeed(-8, false);
            this.self.setYSpeed(-11);
            this.self.updateAttackStats({"allowControl":true});
            SSF2API.destroyTimer(this.self, this.physics);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
        }

        internal function frame45():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

