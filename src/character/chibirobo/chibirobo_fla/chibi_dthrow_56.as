// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_dthrow_56

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.Point;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_dthrow_56 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var effectPoint:*;

        public function chibi_dthrow_56()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 14, this.frame15, 18, this.frame19, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
        }

        internal function frame15():*
        {
            this.effectPoint = new Point(0, 0);
            if (this.self.isFacingRight())
            {
                this.self.attachEffect("bubbleExplosion", {
                    "x":50,
                    "y":-10
                });
            }
            else
            {
                this.self.attachEffect("bubbleExplosion", {
                    "x":-50,
                    "y":-10
                });
            };
            this.self.updateAttackStats({"refreshRate":50});
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "damage":5,
                "priority":0,
                "hitStun":4,
                "selfHitStun":1,
                "effect_id":"effect_heavyHit",
                "direction":100,
                "reversableAngle":false,
                "power":80,
                "kbConstant":40,
                "bypassNonGrabbed":true,
                "effectSound":null
            });
            SSF2API.shakeCamera(10);
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.self.attachEffectOverlay("floorTwinkle");
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

