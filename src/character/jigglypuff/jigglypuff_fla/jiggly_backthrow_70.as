// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_backthrow_70

package jigglypuff_fla
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

    public dynamic class jiggly_backthrow_70 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var prevYLoc:Number;
        public var countDown:Number;

        public function jiggly_backthrow_70()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 9, this.frame10, 15, this.frame16);
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

        internal function frame3():*
        {
            this.prevYLoc = this.self.getY();
        }

        internal function frame4():*
        {
            if (SSF2API != null)
            {
                this.self.setYSpeed(-10);
                this.prevYLoc = this.self.getY();
            };
        }

        internal function frame5():*
        {
            if (SSF2API.isReady())
            {
                this.self.setYSpeed(0);
                this.self.updateAttackStats({"air_ease":0});
            };
        }

        internal function frame8():*
        {
            if ((((SSF2API.isReady()) && (this.self.getY() > (SSF2API.getCamBounds().y - 100))) && (!(this.countDown <= 0))))
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
                if (SSF2API != null)
                {
                    this.self.setYSpeed(0);
                };
            };
        }

        internal function frame9():*
        {
            if (SSF2API.isReady())
            {
                this.self.setYSpeed(20);
                this.self.setXSpeed(0, false);
                this.self.updateAttackStats({"air_ease":30});
            };
        }

        internal function frame10():*
        {
            if (((SSF2API.isReady()) && (!(this.self.isOnGround()))))
            {
                gotoAndPlay("loop2");
            }
            else
            {
                if (SSF2API.isReady())
                {
                    this.self.setYSpeed(0);
                    this.self.updateAttackStats({
                        "allowControl":false,
                        "allowRun":false
                    });
                    SSF2API.shakeCamera(10);
                };
            };
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

