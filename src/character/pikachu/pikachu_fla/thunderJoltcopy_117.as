// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.thunderJoltcopy_117

package pikachu_fla
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

    public dynamic class thunderJoltcopy_117 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var projectile:*;
        public var speed:Number;
        public var sfxStop:int;
        public var facingRight:Boolean;
        public var destroyIndex:*;
        public var forceBounce:*;
        public var bounceIndex:*;
        public var bounceMax:*;

        public function thunderJoltcopy_117()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 9, this.frame10);
        }

        public function init(_arg_1:*):*
        {
            SSF2API.print("ground collision detected");
            SSF2API.removeEventListener(this.projectile, SSF2Event.HIT_WALL, this.init);
            SSF2API.removeEventListener(this.projectile, SSF2Event.GROUND_TOUCH, this.init);
            this.sfxStop = SSF2API.playSound("pika_jolt");
            this.projectile.updateProjectileStats({"gravity":0});
            SSF2API.print("starting bounce listeners");
            SSF2API.addEventListener(this.projectile, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.projectile, SSF2Event.HIT_WALL, this.bounce);
            this.bounce(null);
            SSF2API.createTimer(this.projectile, 1, 0, this.moveJolt, null);
        }

        public function clampAngle(_arg_1:Number):Number
        {
            _arg_1 = ((_arg_1 > 0) ? _arg_1 : (360 + _arg_1));
            return ((_arg_1 >= 360) ? (_arg_1 - 360) : _arg_1);
        }

        public function moveJolt():*
        {
            var _local_5:*;
            var _local_1:* = this.projectile.getXSpeed();
            var _local_2:* = this.projectile.getYSpeed();
            var _local_3:* = ((Math.atan2((-1 * _local_2), _local_1) * 180) / Math.PI);
            var _local_4:* = 30;
            _local_3 = this.clampAngle(_local_3);
            if (this.facingRight)
            {
                _local_5 = this.clampAngle((_local_3 - _local_4));
            }
            else
            {
                _local_5 = this.clampAngle((_local_3 + _local_4));
            };
            if (((this.destroyIndex >= (360 / _local_4)) || (this.bounceIndex > this.bounceMax)))
            {
                SSF2API.print("destroyed because of 360");
                this.projectile.destroy();
            };
            this.destroyIndex++;
            SSF2API.print(("ySpeed = " + _local_2));
            this.projectile.angleControl(this.speed, _local_5);
        }

        public function bounce(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (((this.destroyIndex > 2) || (this.forceBounce)))
            {
                this.bounceIndex++;
                _local_2 = this.projectile.getXSpeed();
                _local_3 = this.projectile.getYSpeed();
                _local_4 = ((Math.atan2((-1 * _local_3), _local_2) * 180) / Math.PI);
                _local_4 = this.clampAngle(_local_4);
                SSF2API.print(((("XSpeed: " + _local_2) + " | YSpeed: ") + _local_3));
                SSF2API.print(((("Angle: " + _local_4) + " | Bounce: ") + this.bounceIndex));
                if (this.facingRight)
                {
                    _local_5 = this.clampAngle(((_local_4 + 90) + 45));
                }
                else
                {
                    _local_5 = this.clampAngle(((_local_4 - 90) - 45));
                };
                SSF2API.print(("New Angle: " + _local_5));
                this.destroyIndex = 0;
                this.projectile.angleControl(this.speed, _local_5);
            };
        }

        internal function frame1():*
        {
            this.projectile = SSF2API.getProjectile(this);
            this.speed = 15;
            this.sfxStop = 0;
            this.destroyIndex = 0;
            this.forceBounce = true;
            this.bounceIndex = 0;
            this.bounceMax = 12;
            if (((SSF2API.isReady()) && (this.projectile)))
            {
                this.facingRight = this.projectile.isFacingRight();
                SSF2API.addEventListener(this.projectile, SSF2Event.HIT_WALL, this.init);
                SSF2API.addEventListener(this.projectile, SSF2Event.GROUND_TOUCH, this.init);
                SSF2API.addEventListener(this.projectile, SSF2Event.PROJ_DESTROYED, function ():*
                {
                    SSF2API.stopSound(sfxStop);
                });
                SSF2API.addEventListener(this.projectile, SSF2Event.ATTACK_CONNECT, this.projectile.destroy);
                SSF2API.addEventListener(this.projectile, SSF2Event.ATTACK_HIT_SHIELD, this.projectile.destroy);
            };
        }

        internal function frame3():*
        {
        }

        internal function frame10():*
        {
            gotoAndPlay("loop");
        }


    }
}//package pikachu_fla

