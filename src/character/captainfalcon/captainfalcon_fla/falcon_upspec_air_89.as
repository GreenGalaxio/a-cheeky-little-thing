// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_upspec_air_89

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

    public dynamic class falcon_upspec_air_89 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var horiz:*;
        public var self:*;
        public var continuePlaying:Boolean;

        public function falcon_upspec_air_89()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 8, this.frame9, 9, this.frame10, 10, this.frame11, 16, this.frame17, 17, this.frame18, 25, this.frame26, 33, this.frame34, 34, this.frame35, 37, this.frame38, 38, this.frame39, 42, this.frame43, 53, this.frame54, 61, this.frame62);
        }

        public function alterHoriz():void
        {
            var _local_1:* = this.self.getControls();
            if ((((this.self.isFacingRight()) && (_local_1.RIGHT)) || ((!(this.self.isFacingRight())) && (_local_1.LEFT))))
            {
                this.horiz = 8;
            }
            else
            {
                if ((((this.self.isFacingRight()) && (_local_1.LEFT)) || ((!(this.self.isFacingRight())) && (_local_1.RIGHT))))
                {
                    this.horiz = 6;
                }
                else
                {
                    this.horiz = 7;
                };
            };
        }

        public function checkGrabbed():*
        {
            if (this.self.getGrabbedOpponent())
            {
                this.self.gotoGrabbedCharacter();
                gotoAndPlay("grabbed");
            };
        }

        public function afterImage():void
        {
            this.self.attachEffect("uspecSparkle");
        }

        internal function frame1():*
        {
            this.horiz = 7;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                this.continuePlaying = false;
                this.self.playAttackSound(1);
                this.self.setXSpeed((this.self.getXSpeed() * 0.5));
                this.self.setYSpeed((this.self.getYSpeed() * 0.5));
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame2():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.alterHoriz);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame9():*
        {
            this.self.setXSpeed(this.horiz, false);
            this.self.setYSpeed(-23);
            SSF2API.createTimer(this.self, 1, 14, this.checkGrabbed);
            SSF2API.createTimer(this.self, 1, 3, this.afterImage);
            SSF2API.destroyTimer(this.self, this.alterHoriz);
        }

        internal function frame10():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":2
            });
        }

        internal function frame11():*
        {
            SSF2API.createTimer(this.self, 2, 3, this.afterImage);
        }

        internal function frame17():*
        {
            SSF2API.createTimer(this.self, 3, 2, this.afterImage);
        }

        internal function frame18():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame26():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            this.self.resetMovement();
            this.self.updateAttackStats({
                "allowControl":false,
                "air_ease":0
            });
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.destroyTimer(this.self, this.checkGrabbed);
            SSF2API.destroyTimer(this.self, this.afterImage);
        }

        internal function frame38():*
        {
            this.self.resetMovement();
        }

        internal function frame39():*
        {
            this.self.updateAttackBoxStats(1, {"effect_id":"effect_firehit1"});
            this.self.refreshAttackID();
            this.self.resetMovement();
        }

        internal function frame43():*
        {
            this.self.setXSpeed(-3, false);
            this.self.setYSpeed(-17);
            this.self.playAttackSound(2);
            this.self.releaseOpponent();
            this.self.attachEffect("explodecircle");
            this.self.playVoiceSound(1);
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame54():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

