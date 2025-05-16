// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_throw_up_45

package metaknight_fla
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

    public dynamic class metaknight_throw_up_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var prevYLoc:Number;
        public var countDown:Number;

        public function metaknight_throw_up_45()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.prevYLoc = 0;
                this.countDown = 4;
            };
        }

        internal function frame2():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-50);
            this.self.playAttackSound(1);
            this.prevYLoc = this.self.getMC().y;
        }

        internal function frame3():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(-50);
                this.prevYLoc = this.self.getMC().y;
            };
        }

        internal function frame4():*
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

        internal function frame5():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(50);
                this.self.updateAttackStats({"allowControl":false});
            };
        }

        internal function frame6():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(50);
            };
        }

        internal function frame7():*
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

        internal function frame8():*
        {
            this.self.updateAttackStats({"allowControl":false});
            SSF2API.shakeCamera(15);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

