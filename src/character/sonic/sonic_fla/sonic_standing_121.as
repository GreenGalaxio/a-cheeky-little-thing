// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_standing_121

package sonic_fla
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

    public dynamic class sonic_standing_121 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var rand:Number;
        public var loopCount:int;

        public function sonic_standing_121()
        {
            addFrameScript(0, this.frame1, 17, this.frame18, 30, this.frame31, 41, this.frame42, 56, this.frame57, 125, this.frame126);
        }

        public function restoreSpecials():*
        {
            this.self.setAttackEnabled("b", true);
            this.self.setAttackEnabled("b_air", true);
            this.self.setAttackEnabled("b_forward", true);
            this.self.setAttackEnabled("b_forward_air", true);
            this.self.setAttackEnabled("b_up", true);
            this.self.setAttackEnabled("b_up_air", true);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.rand = 0;
            this.loopCount = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.restoreSpecials();
                this.rand = (10 * SSF2API.random());
                if (((this.rand >= 9.5) && (this.rand < 9.75)))
                {
                    gotoAndPlay("wagFinger");
                }
                else
                {
                    if (this.rand >= 9.75)
                    {
                        gotoAndPlay("tapFoot");
                    };
                };
            };
        }

        internal function frame18():*
        {
            gotoAndPlay("idle");
        }

        internal function frame31():*
        {
            this.loopCount++;
        }

        internal function frame42():*
        {
            if (this.loopCount <= 6)
            {
                gotoAndPlay("wagFingerLoop");
            };
        }

        internal function frame57():*
        {
            gotoAndPlay("idle");
        }

        internal function frame126():*
        {
            gotoAndPlay("idle");
        }


    }
}//package sonic_fla

