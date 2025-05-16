// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_bair_50

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.Point;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_bair_50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var dir:*;
        public var BubblePos:*;

        public function chibi_bair_50()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 13, this.frame14, 16, this.frame17);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame3():*
        {
            this.dir = 1;
            if (!this.self.isFacingRight())
            {
                this.dir = -1;
            };
            this.BubblePos = new Point((-6 * this.dir), -14);
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame4():*
        {
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            if (this.self.isFacingRight())
            {
                this.BubblePos = new Point((-5 * this.dir), -3);
            };
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame6():*
        {
            this.BubblePos = new Point((-18 * this.dir), -18);
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame7():*
        {
            this.BubblePos = new Point((-48 * this.dir), -22);
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame8():*
        {
            this.BubblePos = new Point((-70 * this.dir), -22);
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame9():*
        {
            this.self.attachEffect("bairbubbles", {
                "x":this.BubblePos.x,
                "y":this.BubblePos.y
            });
        }

        internal function frame14():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

