// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_sspec_35

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class metaknight_sspec_35 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox1:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var player:*;
        public var isRecovering:*;
        public var controls:Object;
        public var speed:Number;
        public var afterDecay:Number;
        public var left:int;
        public var angleTurn:Number;
        public var hor_speed:Number;
        public var vert_speed:Number;
        public var ground:*;

        public function metaknight_sspec_35()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 11, this.frame12, 14, this.frame15, 17, this.frame18, 20, this.frame21, 23, this.frame24, 26, this.frame27, 29, this.frame30, 32, this.frame33, 34, this.frame35, 35, this.frame36, 40, this.frame41, 50, this.frame51);
        }

        public function turnCalc():void
        {
            this.controls = this.self.getControls();
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (this.controls.UP)
                {
                    this.angleTurn = (this.angleTurn + 15);
                }
                else
                {
                    if (this.controls.DOWN)
                    {
                        this.angleTurn = (this.angleTurn - 15);
                    };
                };
                this.hor_speed = (this.speed * Math.cos(((this.angleTurn * Math.PI) / 180)));
                this.vert_speed = (-(this.speed) * Math.sin(((this.angleTurn * Math.PI) / 180)));
                if (((this.angleTurn == 0) || (this.angleTurn == 180)))
                {
                    this.self.updateAttackStats({"air_ease":0});
                }
                else
                {
                    this.self.updateAttackStats({"air_ease":-1});
                };
            };
            this.self.setXSpeed(this.hor_speed, false);
            this.self.setYSpeed(this.vert_speed);
        }

        public function angleUp():void
        {
            if (!this.isRecovering)
            {
                if (((((this.player.inUpperLeftWarningBounds()) || (this.player.inLowerLeftWarningBounds())) || (this.player.inUpperRightWarningBounds())) || (this.player.inLowerRightWarningBounds())))
                {
                    this.player.importCPUControls([2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1, 2112, 1, 0x0800, 1]);
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.playAttackSound(1);
                this.self.setYSpeed((this.self.getYSpeed() * 0.5));
                this.self.setXSpeed((this.self.getXSpeed() * 0.4));
                this.self.updateAttackStats({"allowControl":false});
                this.player = this.self;
                if (((((this.player.inUpperLeftWarningBounds()) || (this.player.inLowerLeftWarningBounds())) || (this.player.inUpperRightWarningBounds())) || (this.player.inLowerRightWarningBounds())))
                {
                    this.isRecovering = true;
                };
                this.controls = this.self.getControls();
                this.speed = 10;
                this.afterDecay = -0.5;
                this.angleTurn = 0;
                this.hor_speed = 4;
                this.vert_speed = 0;
            };
        }

        internal function frame10():*
        {
            this.self.updateAttackStats({"rotate":true});
        }

        internal function frame12():*
        {
            this.self.playAttackSound(3);
            this.ground = this.self.isOnGround();
            this.self.updateAttackStats({"air_ease":-1});
            this.self.unnattachFromGround();
            this.turnCalc();
            this.angleUp();
        }

        internal function frame15():*
        {
            this.self.playAttackSound(4);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame18():*
        {
            this.self.playAttackSound(5);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame21():*
        {
            this.self.playAttackSound(6);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame24():*
        {
            this.self.playAttackSound(7);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame27():*
        {
            this.self.playAttackSound(8);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame30():*
        {
            this.self.playAttackSound(9);
            this.turnCalc();
            this.angleUp();
        }

        internal function frame33():*
        {
            this.self.playAttackSound(10);
            this.turnCalc();
            this.angleUp();
            this.self.updateAttackStats({"air_ease":1});
        }

        internal function frame35():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "rotate":false,
                "refreshRate":50
            });
            this.self.setYSpeed(0);
            this.self.setXSpeed(0);
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "power":50,
                "kbConstant":50,
                "direction":10
            });
            this.self.updateAttackBoxStats(2, {
                "damage":4,
                "power":50,
                "kbConstant":50,
                "direction":10
            });
            this.self.updateAttackBoxStats(3, {
                "damage":4,
                "power":50,
                "kbConstant":50,
                "direction":10
            });
            this.self.refreshAttackID();
            this.self.resetCPUControls();
        }

        internal function frame36():*
        {
            if (!this.self.isOnGround())
            {
                this.self.setYSpeed(-10);
                this.self.setXSpeed(-2, false);
            };
            this.self.refreshAttackID();
        }

        internal function frame41():*
        {
            this.self.setRotation(0);
            if (!this.self.isOnGround())
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

