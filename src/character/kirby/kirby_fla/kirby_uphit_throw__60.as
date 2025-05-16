// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_uphit_throw__60

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class kirby_uphit_throw__60 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var prevYLoc:Number;
        public var countDown:Number;
        public var playsound:Number;
        public var audio:Number;

        public function kirby_uphit_throw__60()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.prevYLoc = 0;
            this.countDown = 4;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame3():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-50);
            this.prevYLoc = this.self.getY();
        }

        internal function frame4():*
        {
            this.self.setYSpeed(-50);
            this.prevYLoc = this.self.getY();
        }

        internal function frame5():*
        {
            if (((this.self.getY() > (SSF2API.getCamBounds().y - 100)) && (!(this.countDown <= 0))))
            {
                this.self.setYSpeed(-50);
                if (Math.abs((this.self.getY() - this.prevYLoc)) < 20)
                {
                    this.countDown--;
                };
                this.prevYLoc = this.self.getY();
                gotoAndPlay("loop");
            }
            else
            {
                this.self.setYSpeed(0);
            };
        }

        internal function frame8():*
        {
            this.self.setYSpeed(50);
        }

        internal function frame9():*
        {
            this.self.setYSpeed(50);
        }

        internal function frame10():*
        {
            if (!this.self.isOnGround())
            {
                this.self.setYSpeed(50);
                gotoAndPlay("loop2");
            }
            else
            {
                this.self.setYSpeed(0);
            };
        }

        internal function frame11():*
        {
            this.self.shakeCamera(15);
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

