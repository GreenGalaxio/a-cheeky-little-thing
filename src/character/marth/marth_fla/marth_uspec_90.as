// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_uspec_90

package marth_fla
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

    public dynamic class marth_uspec_90 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var controls:Object;
        public var facingRight:Boolean;
        public var angle:Number;
        public var speed:Number;
        public var angleAlt:Number;

        public function marth_uspec_90()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 11, this.frame12, 13, this.frame14, 16, this.frame17, 24, this.frame25);
        }

        public function moveIt():void
        {
            this.self.setXSpeed((this.speed * Math.cos(((this.angle * Math.PI) / 180))), false);
            this.self.setYSpeed(((-1 * this.speed) * Math.sin(((this.angle * Math.PI) / 180))));
            this.speed = (this.speed * 0.8);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.angle = 70;
            this.speed = 40;
            this.angleAlt = 15;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            this.facingRight = this.self.isFacingRight();
            this.self.playAttackSound(1);
            this.controls = this.self.getControls();
            if ((((this.facingRight) && (this.controls.LEFT)) || ((!(this.facingRight)) && (this.controls.RIGHT))))
            {
                this.angle = (this.angle + this.angleAlt);
            };
            if ((((this.facingRight) && (this.controls.RIGHT)) || ((!(this.facingRight)) && (this.controls.LEFT))))
            {
                this.angle = (this.angle - this.angleAlt);
            };
            if (this.angle < (this.angle - this.angleAlt))
            {
                this.angle = (this.angle - this.angleAlt);
            };
            if (this.angle > (this.angle + this.angleAlt))
            {
                this.angle = (this.angle + this.angleAlt);
            };
            SSF2API.createTimer(this.self, 1, -1, this.moveIt);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame4():*
        {
            this.self.updateAttackBoxStats(3, {
                "hitStun":3,
                "selfHitStun":1
            });
        }

        internal function frame5():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "priority":-1,
                "hitStun":2,
                "selfHitStun":0,
                "effect_id":"effect_swordSlash",
                "direction":75,
                "power":45,
                "kbConstant":50,
                "effectSound":"brawl_punch_m"
            });
            this.self.updateAttackBoxStats(2, {
                "damage":7,
                "priority":-1,
                "hitStun":2,
                "selfHitStun":0,
                "effect_id":"effect_swordSlash",
                "direction":75,
                "power":45,
                "kbConstant":50,
                "effectSound":"sw_brawl_hit_S"
            });
            this.self.updateAttackBoxStats(3, {
                "damage":7,
                "priority":-1,
                "hitStun":2,
                "selfHitStun":0,
                "effect_id":"effect_swordSlash",
                "direction":45,
                "power":45,
                "kbConstant":50,
                "effectSound":"sw_brawl_hit_M"
            });
        }

        internal function frame12():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
        }

        internal function frame14():*
        {
            this.speed = 0;
        }

        internal function frame17():*
        {
            this.self.destroyTimer(this.moveIt);
        }

        internal function frame25():*
        {
            this.self.toHelpless();
            this.self.endAttack();
        }


    }
}//package marth_fla

