// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_upthrow_602

package goku_fla
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

    public dynamic class ssgoku_upthrow_602 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var prevYLoc:Number;
        public var countDown:Number;

        public function ssgoku_upthrow_602()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 5, this.frame6, 10, this.frame11, 11, this.frame12, 12, this.frame13, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.prevYLoc = 0;
                this.countDown = 7;
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame4():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-50);
            this.prevYLoc = this.self.getMC().y;
        }

        internal function frame5():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(-50);
                this.prevYLoc = this.self.getMC().y;
            };
        }

        internal function frame6():*
        {
            if ((((!(SSF2API == null)) && (this.self.getMC().y > (SSF2API.getCamBounds().y - 100))) && (!(this.countDown <= 0))))
            {
                this.self.setYSpeed(-50);
                if (Math.abs((this.self.getMC().y - this.prevYLoc)) < 20)
                {
                    this.countDown--;
                };
                this.prevYLoc = this.self.getMC().y;
                gotoAndPlay("loop");
            }
            else
            {
                if (SSF2API != null)
                {
                    this.self.setYSpeed(0);
                };
            };
        }

        internal function frame11():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(50);
            };
        }

        internal function frame12():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(50);
            };
        }

        internal function frame13():*
        {
            if (((!(SSF2API == null)) && (!(this.self.isOnGround()))))
            {
                this.self.setYSpeed(50);
                gotoAndPlay("loop2");
            }
            else
            {
                if (SSF2API != null)
                {
                    this.self.setYSpeed(0);
                };
            };
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

