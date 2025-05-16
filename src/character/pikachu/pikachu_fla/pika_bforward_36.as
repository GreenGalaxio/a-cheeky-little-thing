// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.pika_bforward_36

package pikachu_fla
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

    public dynamic class pika_bforward_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;
        public var voice:int;
        public var sfx:int;
        public var xSpeed:Number;
        public var ySpeed:Number;

        public function pika_bforward_36()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 9, this.frame10, 10, this.frame11, 12, this.frame13, 17, this.frame18, 19, this.frame20, 34, this.frame35, 35, this.frame36, 50, this.frame51, 51, this.frame52, 55, this.frame56, 67, this.frame68);
        }

        public function onHit(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.onHit);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("afterHit");
        }

        public function dustTrail():*
        {
            this.self.attachEffect("dustTrail");
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.xframe = null;
                this.voice = this.self.playVoiceSound(1);
                this.xSpeed = 9;
                this.ySpeed = -5;
                this.self.setAttackEnabled(false, "b_forward");
                this.self.setAttackEnabled(false, "b_forward_air");
                this.self.setAttackEnabled(false, "b_up");
                this.self.setAttackEnabled(false, "b_up_air");
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.sfx = this.self.playAttackSound(1);
            this.xSpeed = (this.xSpeed + 1);
        }

        internal function frame10():*
        {
            gotoAndPlay("loop1");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
            SSF2API.stopSound(this.voice);
            SSF2API.createTimer(this.self, 2, 0, this.dustTrail);
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.unnattachFromGround();
            this.self.setXSpeed(this.xSpeed, false);
            this.self.setYSpeed(this.ySpeed);
            this.self.updateAttackStats({"air_ease":0});
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.onHit);
        }

        internal function frame13():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame18():*
        {
            SSF2API.destroyTimer(this.self, this.dustTrail);
        }

        internal function frame20():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "xSpeedDecayAir":-0.57
            });
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            this.xframe = "finish";
            this.self.resetMovement();
            SSF2API.destroyTimer(this.self, this.dustTrail);
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }

        internal function frame52():*
        {
            this.xframe = "finish";
            this.self.resetMovement();
            SSF2API.destroyTimer(this.self, this.dustTrail);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame56():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame68():*
        {
            this.self.endAttack("fall", "nospin");
        }


    }
}//package pikachu_fla

