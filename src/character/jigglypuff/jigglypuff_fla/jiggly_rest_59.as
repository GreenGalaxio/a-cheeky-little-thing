// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_rest_59

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

    public dynamic class jiggly_rest_59 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function jiggly_rest_59()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 13, this.frame14, 93, this.frame94, 106, this.frame107, 115, this.frame116, 123, this.frame124);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.isCPU())
                {
                    if (((((this.self.inUpperRightWarningBounds()) || (this.self.inLowerRightWarningBounds())) || (this.self.inUpperLeftWarningBounds())) || (this.self.inLowerLeftWarningBounds())))
                    {
                        this.self.endAttack();
                    };
                };
                this.self.setIntangibility(true);
                this.self.setXSpeed((this.self.getXSpeed() * 0.5));
            };
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setXSpeed(0);
        }

        internal function frame14():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame94():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame107():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame116():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame124():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

