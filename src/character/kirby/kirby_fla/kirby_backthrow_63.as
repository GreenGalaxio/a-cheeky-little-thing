// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_backthrow_63

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

    public dynamic class kirby_backthrow_63 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var prevYLoc:Number;
        public var countDown:Number;

        public function kirby_backthrow_63()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 8, this.frame9, 14, this.frame15, 15, this.frame16, 16, this.frame17, 21, this.frame22);
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

        internal function frame4():*
        {
            this.self.unnattachFromGround();
            this.self.setYSpeed(-10);
            this.prevYLoc = this.self.getY();
        }

        internal function frame5():*
        {
            this.self.setYSpeed(-10);
            this.self.setXSpeed(-3, false);
            this.prevYLoc = this.self.getY();
        }

        internal function frame9():*
        {
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame15():*
        {
            if (((this.self.getY() > (SSF2API.getCamBounds().y - 100)) && (!(this.countDown <= 0))))
            {
                this.self.setYSpeed(-25);
                if (Math.abs((this.self.getY() - this.prevYLoc)) < 20)
                {
                    this.countDown--;
                };
                this.prevYLoc = this.self.getMC().y;
                gotoAndPlay("loop2");
            }
            else
            {
                this.self.setYSpeed(0);
            };
        }

        internal function frame16():*
        {
            this.self.setYSpeed(20);
            this.self.setXSpeed(0, false);
            this.self.updateAttackStats({"air_ease":30});
        }

        internal function frame17():*
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

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

