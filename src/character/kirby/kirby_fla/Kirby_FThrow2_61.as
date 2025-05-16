// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.Kirby_FThrow2_61

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

    public dynamic class Kirby_FThrow2_61 extends MovieClip 
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

        public function Kirby_FThrow2_61()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 13, this.frame14, 19, this.frame20, 21, this.frame22, 22, this.frame23, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.prevYLoc = 0;
            this.countDown = 7;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame7():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-12);
            this.prevYLoc = this.self.getY();
        }

        internal function frame8():*
        {
            this.self.setYSpeed(-10);
            this.self.setXSpeed(4, false);
            this.prevYLoc = this.self.getY();
        }

        internal function frame14():*
        {
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame20():*
        {
            if (((this.self.getY() > (SSF2API.getCamBounds().y - 100)) && (!(this.countDown <= 0))))
            {
                this.self.setYSpeed(-25);
                if (Math.abs((this.self.getY() - this.prevYLoc)) < 20)
                {
                    this.countDown--;
                };
                this.prevYLoc = this.self.getY();
                gotoAndPlay("loop2");
            }
            else
            {
                this.self.setYSpeed(0);
            };
        }

        internal function frame22():*
        {
            this.self.setYSpeed(20);
            this.self.setXSpeed(0, false);
            this.self.updateAttackStats({"air_ease":30});
        }

        internal function frame23():*
        {
            if (!this.self.isOnGround())
            {
                gotoAndPlay("loop2");
            }
            else
            {
                this.self.setYSpeed(0);
                this.self.shakeCamera(10);
            };
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

