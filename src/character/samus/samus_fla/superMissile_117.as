// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.superMissile_117

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class superMissile_117 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var speed:Number;
        public var time:int;
        public var self:*;

        public function superMissile_117()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 4, this.frame5, 5, this.frame6, 6, this.frame7, 11, this.frame12, 16, this.frame17);
        }

        public function jumpToDie(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.jumpToContinue);
            gotoAndPlay("die");
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToDie);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.jumpToContinue);
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.speed = 0;
            this.time = 0;
            this.self = SSF2API.getProjectile(this);
            if (SSF2API.isReady())
            {
                SSF2API.print(("power missile is " + this.self));
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToDie);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToDie);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.jumpToDie);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.jumpToContinue);
            };
        }

        internal function frame2():*
        {
            this.time++;
            if (this.speed < 15)
            {
                this.speed = (this.speed + 0.8);
            };
            this.self.setXSpeed(this.speed, false);
        }

        internal function frame3():*
        {
            gotoAndPlay("idle");
        }

        internal function frame5():*
        {
            this.self.setYSpeed(-(this.speed));
            this.speed = (this.speed / 2);
            this.self.setXSpeed(-(this.speed), false);
            if (this.time > 38)
            {
                gotoAndPlay("continue");
            };
        }

        internal function frame6():*
        {
            gotoAndPlay("idle");
        }

        internal function frame7():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateProjectileStats({"trailEffect":null});
            this.self.attachEffectOverlay("missileExplode");
        }

        internal function frame12():*
        {
            this.self.destroy();
        }

        internal function frame17():*
        {
            gotoAndStop("loop");
        }


    }
}//package samus_fla

