// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_groundfspecial_new_149

package sonic_fla
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

    public dynamic class sonic_groundfspecial_new_149 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xSpeed:*;
        public var ySpeed:*;
        public var effect:*;

        public function sonic_groundfspecial_new_149()
        {
            addFrameScript(0, this.frame1, 14, this.frame15, 17, this.frame18, 22, this.frame23);
        }

        public function moveIt():void
        {
            this.self.setXSpeed(this.xSpeed, false);
            this.self.setYSpeed(this.ySpeed);
        }

        public function afterImage():void
        {
            this.effect = this.self.attachEffect("sonic_fspecial_afterImage1");
            this.self.applyPalette(this.effect);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xSpeed = 50;
            this.ySpeed = -20;
            this.effect = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame15():*
        {
            this.self.playAttackSound(2);
            this.self.playVoiceSound(2);
            if (this.self.getControls().UP)
            {
                this.xSpeed = 45;
                this.ySpeed = -25;
            }
            else
            {
                if (this.self.getControls().DOWN)
                {
                    this.xSpeed = 55;
                    this.ySpeed = -15;
                };
            };
            SSF2API.createTimer(this.self, 1, 0, this.afterImage);
            SSF2API.createTimer(this.self, 1, 0, this.moveIt);
        }

        internal function frame18():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "canFallOff":true,
                "xSpeedDecay":-0.1,
                "xSpeedDecayAir":-0.1,
                "xSpeedCap":3
            });
            this.self.setYSpeed(-4);
            this.self.setXSpeed(3, false);
            this.self.destroyTimer(this.moveIt);
            this.self.destroyTimer(this.afterImage);
            this.self.updateAttackBoxStats(1, {
                "direction":40,
                "damage":14,
                "kbConstant":49,
                "power":105,
                "shock":true,
                "hitStun":8,
                "selfHitStun":6,
                "effectSound":"brawl_magic_xl"
            });
        }

        internal function frame23():*
        {
            this.self.toHelpless();
            this.self.endAttack();
        }


    }
}//package sonic_fla

