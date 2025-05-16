// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_special_up_air_167

package mario_fla
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

    public dynamic class mario_special_up_air_167 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;
        public var controls:Object;
        public var facingRight:Boolean;
        public var angle:Number;
        public var speed:Number;
        public var angleAlt:Number;

        public function mario_special_up_air_167()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 5, this.frame6, 7, this.frame8, 9, this.frame10, 10, this.frame11, 15, this.frame16, 27, this.frame28, 28, this.frame29, 43, this.frame44);
        }

        public function jumpToContinue(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({
                "allowControl":false,
                "cancelWhenAirborne":true
            });
            this.gotoAndPlay("continue");
        }

        public function moveIt():void
        {
            this.self.setXSpeed((this.speed * Math.cos(((this.angle * Math.PI) / 180))), false);
            this.self.setYSpeed(((-1 * this.speed) * Math.sin(((this.angle * Math.PI) / 180))));
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.angle = ((Math.atan((26 / 18)) * 180) / Math.PI);
            this.speed = 25;
            this.angleAlt = 5.5;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.facingRight = this.self.isFacingRight();
                this.controls = this.self.getControls();
                if ((((this.facingRight) && (this.controls.LEFT)) || ((!(this.facingRight)) && (this.controls.RIGHT))))
                {
                    this.angle = (this.angle + this.angleAlt);
                };
                if ((((this.facingRight) && (this.controls.RIGHT)) || ((!(this.facingRight)) && (this.controls.LEFT))))
                {
                    this.angle = (this.angle - this.angleAlt);
                };
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.attachEffectOverlay("upSpecSparkle");
            };
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            if ((((this.facingRight) && (this.controls.LEFT)) || ((!(this.facingRight)) && (this.controls.RIGHT))))
            {
                this.angle = (this.angle + this.angleAlt);
            };
            if ((((this.facingRight) && (this.controls.RIGHT)) || ((!(this.facingRight)) && (this.controls.LEFT))))
            {
                this.angle = (this.angle - this.angleAlt);
            };
            this.self.setIntangibility(true);
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if ((((this.facingRight) && (this.controls.LEFT)) || ((!(this.facingRight)) && (this.controls.RIGHT))))
            {
                this.angle = (this.angle + this.angleAlt);
            };
            if ((((this.facingRight) && (this.controls.RIGHT)) || ((!(this.facingRight)) && (this.controls.LEFT))))
            {
                this.angle = (this.angle - this.angleAlt);
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if ((((this.facingRight) && (this.controls.LEFT)) || ((!(this.facingRight)) && (this.controls.RIGHT))))
            {
                this.angle = (this.angle + this.angleAlt);
            };
            if ((((this.facingRight) && (this.controls.RIGHT)) || ((!(this.facingRight)) && (this.controls.LEFT))))
            {
                this.angle = (this.angle - this.angleAlt);
            };
            if (this.angle < 45)
            {
                this.angle = 45;
            };
            SSF2API.createTimer(this.self, 1, -1, this.moveIt);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.print("Added ground event listener - mario");
            this.self.setIntangibility(false);
            SSF2API.playSound("super_jump_punch");
        }

        internal function frame6():*
        {
            this.self.updateAttackBoxStats(1, {"damage":1});
            this.self.refreshAttackID();
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":45,
                "kbConstant":110,
                "direction":40,
                "damage":3,
                "weightKB":0
            });
            this.self.refreshAttackID();
            this.self.updateAttackStats({"air_ease":0});
            SSF2API.destroyTimer(this.self, this.moveIt);
            this.self.setYSpeed(0);
            this.self.setXSpeed(0);
        }

        internal function frame16():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1,
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
        }

        internal function frame28():*
        {
            gotoAndStop("again");
        }

        internal function frame29():*
        {
            this.self.updateAttackStats({
                "allowControl":false,
                "cancelWhenAirborne":true
            });
            this.self.resetJumps();
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

