// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_downspecial_93

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

    public dynamic class falcon_downspecial_93 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hasHit:*;
        public var self:*;
        public var grounded:Boolean;

        public function falcon_downspecial_93()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 8, this.frame9, 12, this.frame13, 18, this.frame19, 20, this.frame21, 21, this.frame22, 27, this.frame28, 28, this.frame29, 31, this.frame32, 46, this.frame47, 47, this.frame48, 49, this.frame50, 53, this.frame54, 56, this.frame57);
        }

        public function toFrame(_arg_1:*):*
        {
            gotoAndPlay("continue");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
        }

        public function physics():*
        {
            this.self.setXSpeed(14, false);
            this.self.setYSpeed(13);
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
                this.self.playVoiceSound(1);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.crash);
            };
        }

        internal function frame5():*
        {
            this.self.setXSpeed(-5, false);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
            SSF2API.createTimer(this.self, 1, 13, this.physics);
        }

        internal function frame9():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":12,
                "kbConstant":60
            });
        }

        internal function frame13():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "damage":9,
                "kbConstant":50
            });
        }

        internal function frame19():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.resetMovement);
        }

        internal function frame21():*
        {
            if (this.self.isOnGround())
            {
                gotoAndPlay("continue");
            };
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame22():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":true
            });
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.hasHit = true;
            this.self.updateAttackStats({
                "allowControl":true,
                "xSpeedDecay":100
            });
            this.self.resetMovement();
            this.self.setXSpeed(-8, false);
            this.self.setYSpeed(-11);
            this.self.modifyAllowControl(true);
            SSF2API.destroyTimer(this.self, this.physics);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
        }

        internal function frame32():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toFrame);
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }

        internal function frame48():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "canFallOff":false
            });
        }

        internal function frame50():*
        {
            this.self.setXSpeed(10, false);
            this.grounded = this.self.isOnGround();
            if (!this.grounded)
            {
                gotoAndPlay("airFinish");
            };
        }

        internal function frame54():*
        {
            this.self.setXSpeed(3, false);
        }

        internal function frame57():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

